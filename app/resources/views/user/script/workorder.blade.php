<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script>
    var customerId = "";
    $(document).ready(function() {

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        var route = "";
        $('#workOrderCreateReqDate').datepicker();
        $('#completedByCreateForm').datepicker();
        $('#dashboardReqDate').datepicker();
        $('#check_in_edit').timepicker({
            timeFormat: 'H:i:s'
        });
        $('#check_out_edit').timepicker({
            timeFormat: 'H:i:s'
        });
        $('#dashboardCompletedBy').datepicker();
        $('#workOrderSearchForm').removeClass('d-none');

        //all modal draggable code
        $('.modal-dialog').draggable({
            handle: ".modal-header"
        });

        //create sub ticket start
        $('#subTicketButton').on('click', function() {
            fetchSubTicket('onsite');
        });

        function fetchSubTicket(category) {
            if ($.fn.DataTable.isDataTable('#ticket_type')) {
                $('#ticket_type').DataTable().destroy();
            }

            $('#ticket_type').DataTable({
                processing: true,
                serverSide: true,
                ajax: 'work/order/' + category,
                columns: [{
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'order_id'
                    },
                    {
                        render: function(data, type, row) {
                            return '<i data-id="' + row.id + '" class="fas fa-edit ticketID"></i>';
                        }
                    }
                ],
                columnDefs: [{
                    targets: '_all',
                    "orderable": false
                }]
            });
            $('#subTicketModal').modal('show');
        }

        $(document).on('click', '.ticketID', function() {
            let id = $(this).data('id');
            let rowData = $(this).closest('tr');
            let table = $('#ticket_type').DataTable();
            let selectedRowData = table.row(rowData).data();
            let ticketId = selectedRowData.order_id;
            $('#postSubTicketModal').find('#subticket_ticketID').val(id);
            $('#postSubTicketModal').find('#subticket_ticket_id').val(ticketId);
            $('#postSubTicketModal').modal('show');
        });

        $('#workOrderSearchInput').autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "{{ route('user.get.work.order.search') }}",
                    type: "GET",
                    dataType: "json",
                    data: {
                        "query": request.term,
                    },
                    success: function(data) {
                        response($.map(data.results, function(item) {
                            return {
                                label: item.order_id + "-" + item.company_name,
                                value: item.order_id + "-" + item.company_name,
                                workOrderId: item.id,
                            }
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                var workOrderId = ui.item.workOrderId;
                $('#workOrderId').val(workOrderId);
                workOrderData(workOrderId);
                refresher(workOrderId);
                subTicketTable(workOrderId);
                checkInOutTable(workOrderId);
                siteHistory(workOrderId);
                customerParts(workOrderId);
            }
        });

        function findWorkOrder() {
            $.ajax({
                url: "{{ route('user.workOrder.get') }}",
                type: "POST",
                data: {
                    "id": $('#workOrderId').val()
                },
                success: function(data) {
                    closestTech(data);
                },
                error: function(xhr, status, error) {
                    if (xhr.status === 404) {
                        iziToast.error({
                            message: xhr.responseJSON.message,
                            position: "center"
                        });
                    }
                    if(xhr.status === 400){
                        iziToast.error({
                            message: xhr.responseJSON.message,
                            position: "center"
                        });
                    }
                }
            });
        }

        function ifNullWorkOrder() {
            $.ajax({
                url: "{{ route('user.workOrder.check') }}",
                type: "POST",
                data: {
                    "id": $('#workOrderId').val()
                },
                success: function(data) {

                },
                error: function(xhr, status, error) {
                    if (xhr.status === 404) {
                        iziToast.error({
                            message: xhr.responseJSON.message,
                            position: "center"
                        });
                    }
                }
            });
        }

        function closestTech(destination) {
            $('#loader').removeClass('d-none');

            $.ajax({
                url: "{{ route('user.findTech.withDistance') }}",
                type: "POST",
                data: {
                    "destination": destination
                },
                success: function(data) {
                    $('#loader').addClass('d-none');
                    $('#removable-div').removeClass('d-none');
                    let html = "";
                    $.each(data.technicians, function(key, value) {
                        html += '<tr>' +
                            '<td>' + '<div class="form-check form-switch text-center">' +
                            '<input class="form-check-input close-toggleButton" type="checkbox" id="assignButton">' +
                            '</div>' + '</td>' +
                            '<td hidden>' + value.id + '</td>' +
                            '<td>' + value.technician_id + '</td>' +
                            '<td class="text-nowrap">' + value.company_name + '</td>' +
                            '<td hidden>' + value.email + '</td>' +
                            '<td hidden>' + value.phone + '</td>' +
                            '<td>' + value.status + '</td>' +
                            '<td>' + value.skills + '</td>' +
                            '<td>' + value.rate + '</td>' +
                            '<td>' + value.travel_fee + '</td>' +
                            '<td>' + value.preference + '</td>' +
                            '<td>' + value.distance + '</td>' +
                            '<td>' + value.duration + '</td>' +
                            '<td>' + value.radius + '</td>' +
                            '<td>' + '<button id="contact-btn" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Contact</button>' + '</td>' +
                            '</tr>';
                    });
                    $('#tbody').html(html);
                },
            });
        }

        $(document).on("change", "#assignButton", function() {
            const tr = $(this).closest('tr');
            const tech_id = tr.find('td:eq(1)').text();
            const technician_id = tr.find('td:eq(2)').text();
            const company = tr.find('td:eq(3)').text();
            const status = tr.find('td:eq(6)').text();
            var workOrderId = $('#workOrderId').val();

            if ($(this).is(":checked")) {
                $('#staticBackdrop2').modal('show');
                $('#assign_modal_company_name').text(company);
                $('#assign_modal_tech_id').text(technician_id);
                $('#assign_modal_status').text(status);
                $('#assign_modal_ftech_id').val(tech_id);
                $('#assign_modal_workOrderId').val(workOrderId);
            } else {
                $('#staticBackdrop2').modal('hide');
            }
        });

        $(document).on("click", "#contact-btn", function() {
            const tr = $(this).closest('tr');
            const email = tr.find('td:eq(4)').text();
            $("#contact_modal_email_input").val(email);
            const company = tr.find('td:eq(3)').text();
            const phone = tr.find('td:eq(5)').text();
            $('.contact_modal_company').text(company);
            $("#contact_modal_phone_number").text(phone);
            const phoneNumberLink = `<a href="tel:${phone}">${phone}</a>`;
            $("#contact_modal_phone_number").html(phoneNumberLink);
        });

        $(document).on("click", "#email-btn", function() {
            $('#email-card').removeClass('d-none');
            $("#phone-card").addClass('d-none');
        });

        $(document).on("click", "#phone-btn", function() {
            $("#phone-card").removeClass('d-none');
            $('#email-card').addClass('d-none');
        });

        $(document).on('click', '.btn-close', function() {
            if ($('.close-toggleButton').is(':checked')) {
                $('.close-toggleButton').prop('checked', false);
            }
        });

        $('#send_mail_form').on('submit', function(e) {
            e.preventDefault();
            $('#email-sending-loader').removeClass('d-none');
            let formData = new FormData(this);
            $.ajax({
                url: "{{ route('user.sendmail.tech') }}",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function(data) {
                    $('#email-sending-loader').addClass('d-none');
                    iziToast.success({
                        message: data.message,
                        position: "center"
                    });
                }
            });
        });

        $('#user_dispatch_form').on('click', function(e) {
            e.preventDefault();

            let formData = new FormData(this);

            $.ajax({
                url: "{{ route('user.dispatch.order') }}",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function(data) {
                    iziToast.success({
                        message: data.message,
                        position: "center"
                    });
                    $('#message').text('Technician Assigned!!');
                    $('#removable-div').addClass('d-none');
                    $('#confirmation-div').removeClass('d-none');
                    var workOrderId = data.id;
                    siteHistory(workOrderId);
                }
            });
        });

        function customerParts(id) {
            $.ajax({
                url: "{{ route('user.customer.parts.details') }}",
                type: "GET",
                data: {
                    "work_order_id": id
                },
                success: function(data) {
                    console.log(data);
                    $('#partsCusIdTd').text(data.customerinventory.customer.customer_id);
                    $('#parts-customer-id').val(data.customerinventory.customer.id);
                    $('#partsCusNameTd').text(data.customerinventory.customer.company_name);
                    $('#partsCusAvailPartsTd').text(data.inventoryItem);
                    $('#partsCusTotalPartsTd').text(data.inventoryItemTotal);
                }
            });
        }

        //site history script
        function siteHistory(id) {
            $.ajax({
                url: '/user/get/site/history/' + id,
                method: 'GET',
                success: function(data) {
                    setSiteData(data.result);
                },
                error: function(xhr, status, error) {
                    // Handle errors
                    console.error(error);
                }
            });
        }

        function setSiteData(data) {
            $('#siteHCompany').text('Site Company: ' + (data.company_name || ''));
            $('#siteHLocation').text('Site Location: ' + (data.location || ''));
            $('#siteHAddress').text('Site Address: ' + (data.address_1 || ''));
            $('#siteHZipcode').text('Site Zipcode: ' + (data.zipcode || ''));
            $('#siteHCity').text('Site City: ' + (data.city || ''));
            $('#siteHState').text('Site State: ' + (data.state || ''));
            $('#siteHtech').text('Technician Required: ' + (data.num_tech_required || ''));
            $('#siteHname').text('Site Contact Name: ' + (data.site_contact_name || ''));
            $('#siteHphone').text('Site Contact Phone: ' + (data.site_contact_phone || ''));
            $('#siteHwork').text('Total Work Order: ' + (data.wT || ''));
            $('#siteHwcomplete').text('Total Work Order Complete: ' + (data.wC || ''));
            $('#r_tools').html('' + (data.r_tools || ''));
            $('#ftech_company').text('Company Name: ' + (data.fcompany_name || ''));
            $('#Check_in_ftech_company').val((data.fcompany_name || ''));
            $('#Header_time_zone').text('Time Zone: ' + (data.time_zone || ''));
            $('#time_zone').val((data.time_zone || ''));
            $('#ftech_id').text('Feild Technician ID: ' + (data.technician_id || ''));
            $('#ftech_email').text('Email: ' + (data.ftech_email || ''));
            $('#ftech_address').text('Address: ' + (data.ftech_address || ''));
            $('#ftech_country').text('Country: ' + (data.ftech_country || ''));
            $('#ftech_city').text('City: ' + (data.ftech_city || ''));
            $('#ftech_state').text('State: ' + (data.ftech_state || ''));
            $('#ftech_zipcode').text('Zipcode: ' + (data.ftech_zipcode || ''));
            $('#w_id').val(data.w_id);
            $('#check_in_w_id').val(data.w_id);
        }
        //end site history script

        function checkInOutTable(id) {
            if ($.fn.DataTable.isDataTable('#checkInOutTable')) {
                $('#checkInOutTable').DataTable().destroy();
            }

            $('#checkInOutTable').DataTable({
                processing: true,
                serverSide: true,
                ajax: 'check/in/out/' + id,
                columns: [{
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'date'
                    },
                    {
                        data: 'company_name'
                    },
                    {
                        data: 'tech_name'
                    },
                    {
                        data: 'check_in'
                    },
                    {
                        data: 'check_out'
                    },
                    {
                        data: 'total_hours'
                    },
                    {
                        data: 'time_zone'
                    },
                    {
                        data: null,
                        render: function(data, type, row) {
                            return '<button class="btn btn-success btn-sm checkout-btn m-1">Check-out</button>' +
                                '<button class="btn btn-primary btn-sm edit-btn m-1">Edit</button>';
                        }
                    }
                ],
                columnDefs: [{
                    targets: '_all',
                    orderable: false
                }]
            });
        }


        function subTicketTable(id) {
            if ($.fn.DataTable.isDataTable('#sub_ticket_table')) {
                $('#sub_ticket_table').DataTable().destroy();
            }

            $('#sub_ticket_table').DataTable({
                processing: true,
                serverSide: true,
                ajax: 'work/order/sub/ticket/' + id,
                columns: [{
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'tech_support_note'
                    },

                    {
                        data: null,
                        render: function(data, type, row) {
                            return data.user_data.firstname + ' ' + data.user_data.lastname;
                        }
                    },
                    {
                        data: 'formatted_created_at'
                    },
                    {
                        data: 'formatted_updated_at'
                    },

                    {
                        render: function(data, type, row) {
                            return '<i data-id="" class="fas fa-edit"></i>';
                        }
                    }
                ],
                columnDefs: [{
                    targets: '_all',
                    "orderable": false
                }]
            });
        }

        function closeoutNotes(id) {
            if ($.fn.DataTable.isDataTable('#closeout-notes-table')) {
                $('#closeout-notes-table').DataTable().destroy();
            }

            $('#closeout-notes-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: 'work/order/closeout/notes/' + id,
                columns: [{
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'close_out_notes'
                    },

                    {
                        data: null,
                        render: function(data, type, row) {
                            return data.user_data.firstname + ' ' + data.user_data.lastname;
                        }
                    },
                    {
                        data: 'formatted_created_at'
                    },
                    {
                        data: 'formatted_updated_at'
                    },

                    {
                        render: function(data, type, row) {
                            return '<i data-id="" class="fas fa-edit"></i>';
                        }
                    }
                ],
                columnDefs: [{
                    targets: '_all',
                    "orderable": false
                }]
            });
        }
        //checking/out general notes method
        function generalNotes(id) {
            if ($.fn.DataTable.isDataTable('#general-notes-table')) {
                $('#general-notes-table').DataTable().destroy();
            }

            $('#general-notes-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: 'work/order/general/notes/' + id,
                columns: [{
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'general_notes'
                    },

                    {
                        data: null,
                        render: function(data, type, row) {
                            return data.user_data.firstname + ' ' + data.user_data.lastname;
                        }
                    },
                    {
                        data: 'formatted_created_at'
                    },
                    {
                        data: 'formatted_updated_at'
                    },

                    {
                        render: function(data, type, row) {
                            return '<i data-id="" class="fas fa-edit"></i>';
                        }
                    }
                ],
                columnDefs: [{
                    targets: '_all',
                    "orderable": false
                }]
            });
        }

        function dispatchNotes(id) {
            if ($.fn.DataTable.isDataTable('#dispatch-notes-table')) {
                $('#dispatch-notes-table').DataTable().destroy();
            }

            $('#dispatch-notes-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: 'work/order/dispatch/notes/' + id,
                columns: [{
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'dispatch_notes'
                    },

                    {
                        data: null,
                        render: function(data, type, row) {
                            return data.user_data.firstname + ' ' + data.user_data.lastname;
                        }
                    },
                    {
                        data: 'formatted_created_at'
                    },
                    {
                        data: 'formatted_updated_at'
                    },

                    {
                        render: function(data, type, row) {
                            return '<i data-id="" class="fas fa-edit"></i>';
                        }
                    }
                ],
                columnDefs: [{
                    targets: '_all',
                    "orderable": false
                }]
            });
        }

        function billingNotes(id) {
            if ($.fn.DataTable.isDataTable('#billing-notes-table')) {
                $('#billing-notes-table').DataTable().destroy();
            }

            $('#billing-notes-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: 'work/order/billing/notes/' + id,
                columns: [{
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'billing_notes'
                    },

                    {
                        data: null,
                        render: function(data, type, row) {
                            return data.user_data.firstname + ' ' + data.user_data.lastname;
                        }
                    },
                    {
                        data: 'formatted_created_at'
                    },
                    {
                        data: 'formatted_updated_at'
                    },

                    {
                        render: function(data, type, row) {
                            return '<i data-id="" class="fas fa-edit"></i>';
                        }
                    }
                ],
                columnDefs: [{
                    targets: '_all',
                    "orderable": false
                }]
            });
        }

        function techSupportNotes(id) {
            if ($.fn.DataTable.isDataTable('#techSupport-notes-table')) {
                $('#techSupport-notes-table').DataTable().destroy();
            }

            $('#techSupport-notes-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: 'work/order/tech/support/notes/' + id,
                columns: [{
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'tech_support_notes'
                    },

                    {
                        data: null,
                        render: function(data, type, row) {
                            return data.user_data.firstname + ' ' + data.user_data.lastname;
                        }
                    },
                    {
                        data: 'formatted_created_at'
                    },
                    {
                        data: 'formatted_updated_at'
                    },

                    {
                        render: function(data, type, row) {
                            return '<i data-id="" class="fas fa-edit"></i>';
                        }
                    }
                ],
                columnDefs: [{
                    targets: '_all',
                    "orderable": false
                }]
            });
        }

        //get work order  data from this function
        function workOrderData(id) {
            $.ajax({
                url: "{{ route('user.get.work.order') }}",
                type: "GET",
                data: {
                    "id": id
                },
                success: function(data) {
                    setField(data);
                }
            });
        }

        //function for populate all the dashboard field
        function setField(data) {
            $('#dashboardCustomerAddress').val(data.result.customer_address);
            $('#dashboardCustomerCity').val(data.result.customer_city);
            $('#dashboardCustomerState').val(data.result.customer_state);
            $('#dashboardCustomerZipcode').val(data.result.customer_zipcode);
            $('#dashboardCustomerPhone').val(data.result.customer_phone);
            $('#dashboardCustomerId').val(data.result.customer_id);
            $('#dashboardScopeOfWork').val(data.result.scope_work);
            $('#dashboardToolsRequired').val(data.result.tools_required);
            $('#dashboardSiteId').val(data.result.customer_site_id);
            $('#dashboardSiteAddress').val(data.result.customer_site_address);
            $('#dashboardSiteCity').val(data.result.customer_site_city);
            $('#dashboardSiteZipcode').val(data.result.customer_site_zipcode);
            $('#dashboardSiteState').val(data.result.customer_site_state);
            $('#dashboardSiteContact').val(data.result.site_contact);
            $('#dashboardSiteContactPhone').val(data.result.site_contact_phone);
            $('#dashboardSiteHoursOp').val(data.result.site_hours_operation);
            $('#dashboardOnsiteBy').val(data.result.onsite_by);
            $('#dashboardNumOfTech').val(data.result.number_of_tech);
            $('#dashboardReqDate').val(data.result.requested_date);
            $('#dashboardReqBy').val(data.result.requested_by);
            $('#dashboardCompletedBy').val(data.result.completed_by);

            $('#dashboardEmailPhoneSelect option').each(function() {
                if ($(this).val() === data.result.request_type) {
                    $(this).prop('selected', true);
                    return false;
                }
            });

            $('#dashboardWorkOrderStatus option').each(function() {
                if ($(this).val() == data.result.status) {
                    $(this).prop('selected', true);
                    return false;
                }
            });

            $('#dashboardPrioritySelect option').each(function() {
                if ($(this).val() == data.result.priority) {
                    $(this).prop('selected', true);
                    return false;
                }
            });
        }

        $(document).on('click', '#notes-tab', function() {
            ifNullWorkOrder();
            $('#workOrderSearchForm').addClass('d-none');
            $('#site_history_view').addClass('d-none');
            $('#notes-container').removeClass('d-none');
            $("#parts_view").addClass('d-none');
            $("#fieldTech_view").addClass('d-none');
            $("#ticket_view").addClass('d-none');
            $("#check_out_view").addClass('d-none');
            $("#tech_distance_view").addClass('d-none');
        });

        $(document).on('click', '#work-order-tab', function() {
            $('#workOrderSearchForm').removeClass('d-none');
            $('#notes-container').addClass('d-none');
            $('#site_history_view').addClass('d-none');
            $("#parts_view").addClass('d-none');
            $("#fieldTech_view").addClass('d-none');
            $("#ticket_view").addClass('d-none');
            $("#check_out_view").addClass('d-none');
            $("#tech_distance_view").addClass('d-none');
        });

        $('#site-history-tab').click(function() {
            ifNullWorkOrder();
            $('#workOrderSearchForm').addClass('d-none');
            $('#notes-container').addClass('d-none');
            $('#site_history_view').removeClass('d-none');
            $("#parts_view").addClass('d-none');
            $("#fieldTech_view").addClass('d-none');
            $("#ticket_view").addClass('d-none');
            $("#check_out_view").addClass('d-none');
            $("#tech_distance_view").addClass('d-none');
        });
        $("#parts").click(function() {
            ifNullWorkOrder();
            $('#workOrderSearchForm').addClass('d-none');
            $('#notes-container').addClass('d-none');
            $('#site_history_view').addClass('d-none');
            $("#parts_view").removeClass('d-none');
            $("#fieldTech_view").addClass('d-none');
            $("#ticket_view").addClass('d-none');
            $("#check_out_view").addClass('d-none');
            $("#tech_distance_view").addClass('d-none');
        });
        $("#fieldTech").click(function() {
            ifNullWorkOrder();
            $('#workOrderSearchForm').addClass('d-none');
            $('#notes-container').addClass('d-none');
            $('#site_history_view').addClass('d-none');
            $("#parts_view").addClass('d-none');
            $("#fieldTech_view").removeClass('d-none');
            $("#ticket_view").addClass('d-none');
            $("#check_out_view").addClass('d-none');
            $("#tech_distance_view").addClass('d-none');
        });
        $("#ticket").click(function() {
            ifNullWorkOrder();
            $('#workOrderSearchForm').addClass('d-none');
            $('#notes-container').addClass('d-none');
            $('#site_history_view').addClass('d-none');
            $("#parts_view").addClass('d-none');
            $("#fieldTech_view").addClass('d-none');
            $("#ticket_view").removeClass('d-none');
            $("#check_out_view").addClass('d-none');
            $("#tech_distance_view").addClass('d-none');
        });
        $("#check_out").click(function() {
            ifNullWorkOrder();
            $('#workOrderSearchForm').addClass('d-none');
            $('#notes-container').addClass('d-none');
            $('#site_history_view').addClass('d-none');
            $("#parts_view").addClass('d-none');
            $("#fieldTech_view").addClass('d-none');
            $("#ticket_view").addClass('d-none');
            $("#check_out_view").removeClass('d-none');
            $("#tech_distance_view").addClass('d-none');
        });
        $("#tech_distance").click(function() {
            findWorkOrder();
            $('#workOrderSearchForm').addClass('d-none');
            $('#notes-container').addClass('d-none');
            $('#site_history_view').addClass('d-none');
            $("#parts_view").addClass('d-none');
            $("#fieldTech_view").addClass('d-none');
            $("#ticket_view").addClass('d-none');
            $("#check_out_view").addClass('d-none');
            $("#tech_distance_view").removeClass('d-none');
        });

        //search work Order start
        $("#Wsearch").click(function() {
            $("#defualtWorkOrder").removeClass('d-none');
            $("#workOrderCreateForm").addClass('d-none');
            $('#notes-container').addClass('d-none');
            $("#workOrderSearchForm").removeClass('d-none');
            $('#site_history_view').addClass('d-none');
            $("#parts_view").addClass('d-none');
            $("#ticket_view").addClass('d-none');
            $("#fieldTech_view").addClass('d-none');
            $("#check_out_view").addClass('d-none');

        });
        //search work order end 

        //service create script
        $('#serviceButton').click(function() {
            route = '{{ route("user.work.order.service") }}';
            createWorkOrder(route);
        });

        //project create script
        $('#projectButton').click(function() {
            route = '{{ route("user.work.order.project") }}';
            createWorkOrder(route);
        });

        //install create script
        $('#installButton').click(function() {
            route = '{{ route("user.work.order.install") }}';
            createWorkOrder(route);
        });

        function createWorkOrder(route) {
            $("#defualtWorkOrder").addClass('d-none');
            $('#notes-container').addClass('d-none');
            $("#workOrderCreateForm").removeClass("d-none");
            var csrfToken = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                url: route,
                type: 'POST',
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                success: function(response) {
                    fieldPopulator(response.id);
                    iziToast.success({
                        message: response.message,
                        position: "center"
                    });
                },
                error: function(xhr, status, error) {}
            });
        }

        //fill data when new service,project,install is created
        function fieldPopulator(id) {
            $.ajax({
                url: "{{ route('user.order.data') }}",
                type: "GET",
                data: {
                    "id": id,
                },
                success: function(response) {
                    // customerAutoComplete();
                    // siteAutoComplete();
                    $('#workOrderCreateInput').val(response.order_id);
                    $('#workOrderCreateReqDate').val(response.open_date);
                    $('#workOrderCreateStatus option').each(function() {
                        if ($(this).val() == response.status) {
                            $(this).prop('selected', true);
                            return false;
                        }
                    });
                }
            });
        }

        $('#dashboardCustomerId').autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "{{ route('user.customer.autocomplete.wosearch') }}",
                    type: "GET",
                    dataType: "json",
                    data: {
                        "query": request.term,
                    },
                    success: function(data) {
                        response($.map(data.results, function(item) {
                            return {
                                label: item.customer_id + "-" + item.company_name + "-" + item.address.zip_code,
                                value: item.customer_id + "-" + item.company_name + "-" + item.address.zip_code,
                                cusId: item.id,
                            }
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                var selectedCusId = ui.item.cusId;
                loadCustomer(selectedCusId, 1);
                createDynamicInput(selectedCusId, "wo-search-cusId", "#dashboardCustomerId");
            }
        });


        //site autocomplete for search workorder form
        $('#dashboardSiteId').autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "{{ route('user.site.autocomplete') }}",
                    type: "GET",
                    dataType: "json",
                    data: {
                        "query": request.term,
                        "id" : $('#wo-search-cusId').val(),
                    },
                    success: function(data) {
                        $('#dashboardSiteIdErrors').text("");
                        response($.map(data.results, function(item) {
                            return {
                                label: item.site_id + "-" + item.location + "-" + item.zipcode,
                                value: item.site_id + "-" + item.location + "-" + item.zipcode,
                                siteID: item.id,
                            }
                        }));
                    },
                    error:function(xhr, status, errors){
                        if(xhr.status == 422){
                            $('#dashboardSiteIdErrors').text(xhr.responseJSON.errors);
                        }
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                var selectedSiteId = ui.item.siteID;
                loadSite(selectedSiteId, 1);

            }
        });


        //customer autocomplete for work order create form
        $('#CustomerIdCreateForm').autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "{{ route('user.customer.autocomplete.wosearch') }}",
                    type: "GET",
                    dataType: "json",
                    data: {
                        "query": request.term,
                    },
                    success: function(data) {
                        response($.map(data.results, function(item) {
                            return {
                                label: item.customer_id + "-" + item.company_name + "-" + item.address.zip_code,
                                value: item.customer_id + "-" + item.company_name + "-" + item.address.zip_code,
                                cusId: item.id,
                            }
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                var selectedCusId = ui.item.cusId;
                loadCustomer(selectedCusId, 2);
                createDynamicInput(selectedCusId, "createFormCusId", "#CustomerIdCreateForm");
            }
        });

        //site autocomplete for create workorder form
        $('#siteIdCreateForm').autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "{{ route('user.site.autocomplete') }}",
                    type: "GET",
                    dataType: "json",
                    data: {
                        "query": request.term,
                        "id" : $('#createFormCusId').val(),
                    },
                    success: function(data) {
                        $('#siteIdCreateFormErrors').text("");
                        response($.map(data.results, function(item) {
                            return {
                                label: item.site_id + "-" + item.location + "-" + item.zipcode,
                                value: item.site_id + "-" + item.location + "-" + item.zipcode,
                                siteID: item.id,
                            }
                        }));
                    },
                    error:function(xhr, status, errors){
                        if(xhr.status == 422){
                            $('#siteIdCreateFormErrors').text(xhr.responseJSON.errors);
                        }
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                var selectedSiteId = ui.item.siteID;
                loadSite(selectedSiteId, 2);
            }
        });

        function loadSite(id, type) {
            $.ajax({
                url: "{{ route('user.get.site' )}}",
                type: "GET",
                data: {
                    "id": id
                },
                success: function(data) {
                    if(type === 1){
                        $('#dashboardSiteAddress').val(data.result.address);
                        $('#dashboardSiteCity').val(data.result.city);
                        $('#dashboardSiteState').val(data.result.state);
                        $('#dashboardSiteZipcode').val(data.result.zipcode);
                    }else{
                        $('#siteAddressCreateForm').val(data.result.address);
                        $('#siteCityCreateForm').val(data.result.city);
                        $('#siteStateCreateForm').val(data.result.state);
                        $('#siteZipcodeCreateForm').val(data.result.zipcode);
                    }
                }
            });
        }

        //load customer for both workorder search panel and create wo panel when user search for a customer
        function loadCustomer(id, type) {
            $.ajax({
                url: "get/customer/details",
                type: "GET",
                data: {
                    "id": id
                },
                success: function(data) {
                    if(type === 1){
                        $('#dashboardCustomerPhone').val(data.phone);
                        $('#dashboardCustomerState').val(data.address.state);
                        $('#dashboardCustomerCity').val(data.address.city);
                        $('#dashboardCustomerAddress').val(data.address.address);
                        $('#dashboardCustomerZipcode').val(data.address.zip_code);
                        $('#dashboardPm').val(data.project_manager);
                        $('#dashboardSp').val(data.sales_person);
                    }else{
                        $('#customerPhoneCreateForm').val(data.phone);
                        $('#customerStateCreateForm').val(data.address.state);
                        $('#customerCityCreateForm').val(data.address.city);
                        $('#customerAddressCreateForm').val(data.address.address);
                        $('#customerZipcodeCreateForm').val(data.address.zip_code);
                        $('#customerPmCreateForm').val(data.project_manager);
                        $('#customerSpCreateForm').val(data.sales_person);
                    }
                }
            });
        }

        //note button script
        $("#general").click(function() {
            $("#generalNote").removeClass('d-none');
            $("#closeOut").addClass('d-none');
            $("#dNote").addClass('d-none');
            $("#tNote").addClass('d-none');
            $("#bNote").addClass('d-none');
        });
        $("#close").click(function() {
            $("#closeOut").removeClass('d-none');
            $("#dNote").addClass('d-none');
            $("#tNote").addClass('d-none');
            $("#bNote").addClass('d-none');
            $("#generalNote").addClass('d-none');
        });
        $("#dispatch").click(function() {
            $("#dNote").removeClass('d-none');
            $("#tNote").addClass('d-none');
            $("#bNote").addClass('d-none');
            $("#generalNote").addClass('d-none');
            $("#closeOut").addClass('d-none');
        });
        $("#tech").click(function() {
            $("#tNote").removeClass('d-none');
            $("#bNote").addClass('d-none');
            $("#generalNote").addClass('d-none');
            $("#closeOut").addClass('d-none');
            $("#dNote").addClass('d-none');
        });
        $("#bill").click(function() {
            $("#bNote").removeClass('d-none');
            $("#generalNote").addClass('d-none');
            $("#closeOut").addClass('d-none');
            $("#dNote").addClass('d-none');
            $("#tNote").addClass('d-none');
        });
        //end note button script

        // work order update script start
        $('#WOFORM').on('submit', function(event) {
            event.preventDefault();
            var formData = $(this).serialize();
            var csrfToken = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                url: 'work/order/update',
                type: 'POST',
                data: formData,
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                success: function(response) {
                    refresher(response.id);
                    iziToast.success({
                        message: response.message,
                        position: "center"
                    });
                },
                error: function(xhr) {
                    console.log('Error:', xhr.responseText);
                }
            });
        });

        $('#defaultWO').on('submit', function(event) {
            event.preventDefault();
            var formData = new FormData(this);
            var csrfToken = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                url: 'work/order/update',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                success: function(response) {
                    $("#generalNote").addClass('d-none');
                    $("#closeOut").addClass('d-none');
                    $("#dNote").addClass('d-none');
                    $("#tNote").addClass('d-none');
                    $("#bNote").addClass('d-none');
                    refresher(response.id);
                    console.log(response.message);
                    iziToast.success({
                        message: response.message,
                        position: "center"
                    });
                },
                error: function(xhr) {
                    let errorMessage = "";
                    if (xhr.responseJSON && xhr.responseJSON.error) {
                        errorMessage = xhr.responseJSON.error;
                    }
                    iziToast.error({
                        title: 'Make sure The customer and site ID must be include',
                        message: errorMessage,
                        position: 'center'
                    });
                }
            });
        });


        function refresher(id) {
            generalNotes(id);
            dispatchNotes(id);
            billingNotes(id);
            techSupportNotes(id);
            closeoutNotes(id);
        }

        //create sub ticket script
        $('#create_sub_ticket').on('submit', function(event) {
            event.preventDefault();

            var formData = $(this).serialize();
            var csrfToken = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                url: 'sub/ticket/create',
                type: 'POST',
                data: formData,
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                success: function(response) {
                    subTicketTable(response.id);
                    iziToast.success({
                        message: response.message,
                        position: "center"
                    });
                },
                error: function(xhr, status, error) {
                    let errorMessage = "";
                    if (xhr.responseJSON && xhr.responseJSON.error) {
                        errorMessage = xhr.responseJSON.error;
                    }
                    iziToast.error({
                        title: 'Error',
                        message: errorMessage,
                        position: 'center'
                    });
                }
            });
        });
        //end sub ticket script

        //create checkin script
        $('#create_check_in').on('submit', function(event) {
            event.preventDefault();
            var formData = $(this).serialize();
            var csrfToken = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                url: 'create/check/in',
                type: 'POST',
                data: formData,
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                success: function(response) {
                    checkInOutTable(response.id);
                    iziToast.success({
                        message: response.message,
                        position: "center"
                    });
                },
                error: function(xhr, status, error) {
                    let errorMessage = "";
                    if (xhr.responseJSON && xhr.responseJSON.error) {
                        errorMessage = xhr.responseJSON.error;
                    }
                    iziToast.error({
                        title: 'Error',
                        message: errorMessage,
                        position: 'center'
                    });
                }
            });
        });
        //end checkin script

        //checkout script
        $('#checkInOutTable').on('click', '.checkout-btn', function(event) {
            event.preventDefault();
            var rowData = $('#checkInOutTable').DataTable().row($(this).closest('tr')).data();
            //console.log(rowData.id);
            if (rowData) {
                openRoundTripModal(rowData);
            } else {
                console.error('Row data not found.');
            }
        });

        function openRoundTripModal(rowData) {
            $('#roundTripModal').modal('show');
            $('#r_trip').val(rowData.id);
            $('#c_check_out').val(rowData.id);
            console.log('Editing row:', rowData);
            $("#c_check_out").click(function() {
                initiateCheckOut(rowData.id);
            });
            $("#r_trip").click(function() {
                initiateRoundtripCheckOut(rowData.id);
            });
        }

        function initiateCheckOut(id) {
            var csrfToken = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                url: 'create/check/out/' + id,
                type: 'POST',
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                success: function(response) {
                    checkInOutTable(response.id);
                    iziToast.success({
                        message: response.message,
                        position: "center"
                    });
                },
                error: function(xhr, status, error) {
                    let errorMessage = "";
                    if (xhr.responseJSON && xhr.responseJSON.error) {
                        errorMessage = xhr.responseJSON.error;
                    }
                    iziToast.error({
                        title: 'Already Check-out Success',
                        message: errorMessage,
                        position: 'center'
                    });
                }
            });
        }

        function initiateRoundtripCheckOut(id) {
            var csrfToken = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                url: 'create/round/trip/check/out/' + id,
                type: 'POST',
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                success: function(response) {
                    checkInOutTable(response.id);
                    iziToast.success({
                        message: response.message,
                        position: "center"
                    });
                },
                error: function(xhr, status, error) {
                    let errorMessage = "";
                    if (xhr.responseJSON && xhr.responseJSON.error) {
                        errorMessage = xhr.responseJSON.error;
                    }
                    iziToast.error({
                        title: 'Already Check-out Success',
                        message: errorMessage,
                        position: 'center'
                    });
                }
            });
        }

        //end checkout script

        //check-in-out edit script
        $('#checkInOutTable').on('click', '.edit-btn', function(event) {
            event.preventDefault();
            var rowData = $('#checkInOutTable').DataTable().row($(this).closest('tr')).data();

            if (rowData) {
                openEditModal(rowData);
            } else {
                console.error('Row data not found.');
            }
        });

        function openEditModal(rowData) {
            $('#editModal').modal('show');
            $('#edit_w_id').val(rowData.work_order_id);
            $('#edit_id').val(rowData.id);
            $('#tech_name').val(rowData.tech_name);
            $('#check_in_edit').val(rowData.check_in);
            $('#check_out_edit').val(rowData.check_out);
            console.log('Editing row:', rowData);
        }
        $('#check_in_out_edit_form').on('submit', function(event) {
            event.preventDefault();
            var formData = $(this).serialize();
            var r_id = $("#edit_id").val();
            var csrfToken = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                url: 'check/in/out/update/' + r_id,
                type: 'POST',
                data: formData,
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                success: function(response) {
                    checkInOutTable($("#edit_w_id").val());
                    iziToast.success({
                        message: response.message,
                        position: "center"
                    });
                },
                error: function(xhr, status, error) {
                    let errorMessage = "";
                    if (xhr.responseJSON && xhr.responseJSON.error) {
                        errorMessage = xhr.responseJSON.error;
                    }
                    iziToast.error({
                        title: 'Error',
                        message: errorMessage,
                        position: 'center'
                    });
                }
            });
        });

        $("#delete_check_in_out").click(function() {
            var r_id = $("#edit_id").val();
            $.ajax({
                url: 'check/in/out/delete/' + r_id,
                type: 'GET',
                success: function(response) {
                    $('#editModal').modal('hide');
                    checkInOutTable($("#edit_w_id").val());
                    iziToast.success({
                        message: response.message,
                        position: "center"
                    });
                },
                error: function(xhr, status, error) {
                    let errorMessage = "";
                    if (xhr.responseJSON && xhr.responseJSON.error) {
                        errorMessage = xhr.responseJSON.error;
                    }
                    iziToast.error({
                        title: 'Error',
                        message: errorMessage,
                        position: 'center'
                    });
                }
            });
        });
        //end check-in-out edit script

        // work order update script end

        $('#parts-search-parts').autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "{{ route('user.inventory.autocomplete') }}",
                    type: "GET",
                    dataType: "json",
                    data: {
                        "query": request.term,
                        "customer_id": $('#parts-customer-id').val()
                    },
                    success: function(data) {
                        response($.map(data.results, function(item) {
                            return {
                                label: item.part_number,
                                value: item.part_number,
                                partID: item.id,
                            }
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                var selectedPartId = ui.item.partID;
                inventoryItem(selectedPartId);
                getResponse(selectedPartId);
            }
        });

        function inventoryItem(id) {
            $.ajax({
                url: "{{ route('user.inventory.item') }}",
                type: "GET",
                data: {
                    "id": id
                },
                success: function(data) {
                    $('#parts-item-name').val(data.item_name);
                    $('#parts-quantity').val(data.quantity);
                    $('#parts-unit-price').val(data.unit_cost);
                }
            });
        }

        function getResponse(id) {
            $('#parts-quantity-need').on('keyup', function() {
                var typedNumber = $(this).val();

                $.ajax({
                    url: "{{ route('user.inventory.calculation') }}",
                    type: "GET",
                    data: {
                        "item_id": id,
                        "item_value": typedNumber
                    },
                    success: function(data) {
                        $('#parts-total-price').val(data);
                    }
                });
            });
        }

        // generate dynamic input element
        function createDynamicInput(value, inputId, placement) {
            
            let dynamicInput = $("<input>").attr({
                type: "hidden",
                value: value,
                id: inputId
            });

            dynamicInput.insertAfter(placement);
        }
        //ready callback end block all the code should be written above.  
    });
</script>

<!-- dashboard script -->
<script>
    (function($) {
        $.fn.menumaker = function(options) {
            var cssmenu = $(this),
                settings = $.extend({
                    format: "dropdown",
                    sticky: false
                }, options);
            return this.each(function() {
                $(this).find(".button").on('click', function() {
                    $(this).toggleClass('menu-opened');
                    var mainmenu = $(this).next('ul');
                    if (mainmenu.hasClass('open')) {
                        mainmenu.slideToggle().removeClass('open');
                    } else {
                        mainmenu.slideToggle().addClass('open');
                        if (settings.format === "dropdown") {
                            mainmenu.find('ul').show();
                        }
                    }
                });
                cssmenu.find('li ul').parent().addClass('has-sub');
                multiTg = function() {
                    cssmenu.find(".has-sub").prepend('<span class="submenu-button"></span>');
                    cssmenu.find('.submenu-button').on('click', function() {
                        $(this).toggleClass('submenu-opened');
                        if ($(this).siblings('ul').hasClass('open')) {
                            $(this).siblings('ul').removeClass('open').slideToggle();
                        } else {
                            $(this).siblings('ul').addClass('open').slideToggle();
                        }
                    });
                };
                if (settings.format === 'multitoggle') multiTg();
                else cssmenu.addClass('dropdown');
                if (settings.sticky === true) cssmenu.css('position', 'fixed');
                resizeFix = function() {
                    var mediasize = 1000;
                    if ($(window).width() > mediasize) {
                        cssmenu.find('ul').show();
                    }
                    if ($(window).width() <= mediasize) {
                        cssmenu.find('ul').hide().removeClass('open');
                    }
                };
                resizeFix();
                return $(window).on('resize', resizeFix);
            });
        };
    })(jQuery);

    (function($) {
        $(document).ready(function() {
            $("#cssmenu").menumaker({
                format: "multitoggle"
            });
        });
    })(jQuery);
</script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
    $('.summernote').summernote({
        tabsize: 2,
        height: 120,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ]
    });
</script>