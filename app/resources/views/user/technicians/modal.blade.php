<style>
    label {
        font-weight: bold;
        color: #333;
    }
    @keyframes fadeIn {
        from {
            opacity: 0;
        }

        to {
            opacity: 1;
        }
    }
    #techSkillsForm {
        animation: fadeIn 0.5s ease-in-out;
    }

</style>

<script>
    document.getElementById('addSetsBtn').addEventListener('click', function() {
        document.getElementById('techSkillsForm').classList.toggle('d-none');
    });
</script>

<div class="modal fade" id="newTechnicianModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Register New Technician</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="d-none" id="ftechSkillBlock">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <!-- Displayed when the button is not clicked -->
                            <button id="addSetsBtn" class="btn btn-primary btn-sm">
                                <i class="fa fa-plus"></i> Add Skillsets
                            </button>
                        </div>
                        <div class="col-4">
                            <form id="techSkillsForm" class="d-none">
                                @csrf
                                <label>Add New Skillset</label>
                                <div class="form-group">
                                    <div class="d-flex">
                                        <input type="text" name="skill_name" class="form-control" placeholder="Enter skillsets">
                                        <button type="submit" class="btn btn-primary btn-sm mx-2">Add</button>
                                    </div>
                                    <span style="color: red; font-size: 14px" id="skillset-error"></span>
                                    <span id="success-container" style="font-weight: bold; font-size: 14px; color: #0e0444"></span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>



            <script>
                document.getElementById('addSetsBtn').addEventListener('click', function() {
                    // Toggle the visibility of the form when the button is clicked
                    document.getElementById('techSkillsForm').classList.toggle('d-none');
                });
            </script>
            <div class="d-none" id="techRegistration">
                <form id="newTechnicianModalForm">
                    @csrf
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-4">
                                <label>Company Name</label>
                                <input type="text" class="form-control" placeholder="Enter company name" name="company_name">
                                <span style="color: red; font-size: 14px" id="company_name_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Address</label>
                                <input type="text" class="form-control" placeholder="Enter address" name="address">
                                <span style="color: red; font-size: 14px" id="address_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Country</label>
                                <input type="text" class="form-control" placeholder="Enter country" name="country">
                                <span style="color: red; font-size: 14px" id="country_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>City</label>
                                <input type="text" class="form-control" placeholder="Enter city" name="city">
                                <span style="color: red; font-size: 14px" id="city_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>State</label>
                                <input type="text" class="form-control" placeholder="Enter state" name="state">
                                <span style="color: red; font-size: 14px" id="state_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Zipcode</label>
                                <input type="text" class="form-control" placeholder="Enter zipcode" name="zip_code">
                                <span style="color: red; font-size: 14px" id="zip_code_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Email</label>
                                <input type="text" class="form-control" placeholder="Enter email" name="email">
                                <span style="color: red; font-size: 14px" id="email_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Phone</label>
                                <input type="text" class="form-control" placeholder="Enter phone" name="phone">
                                <span style="color: red; font-size: 14px" id="phone_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Primary Contact Name</label>
                                <input type="text" class="form-control" placeholder="Enter primary contact name" name="primary_contact">
                                <span style="color: red; font-size: 14px" id="primary_contact_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Primary Contact's Email</label>
                                <input type="text" class="form-control" placeholder="Enter primary contacts email" name="primary_contact_email">
                                <span style="color: red; font-size: 14px" id="primary_contact_email_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Title</label>
                                <input type="text" class="form-control" placeholder="Enter title" name="title">
                                <span style="color: red; font-size: 14px" id="title_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Cell Phone</label>
                                <input type="text" class="form-control" placeholder="Enter cell phone" name="cell_phone">
                                <span style="color: red; font-size: 14px" id="cell_phone_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Rate</label>
                                <input type="number" class="form-control" placeholder="Enter rate" name="rate">
                                <span style="color: red; font-size: 14px" id="rate_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Radius</label>
                                <input type="number" class="form-control" placeholder="Enter radius" name="radius">
                                <span style="color: red; font-size: 14px" id="radius_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Travel Fee</label>
                                <input type="number" class="form-control" placeholder="Enter travel fee" name="travel_fee">
                                <span style="color: red; font-size: 14px" id="travel_fee_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label for="status">Select Status</label>
                                <select name="status" class="form-control">
                                    <option value="">Select Status</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                    <option value="Pending">Pending</option>
                                </select>
                                <span style="color: red; font-size: 14px" id="status_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>COI Expiration Date</label>
                                <input type="date" class="form-control" id="tech_modal_coi_expire_date" placeholder="COI expiration date" autocomplete="off" name="coi_expire_date">
                                <span style="color: red; font-size: 14px" id="coi_expire_date_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>COI Attachment</label>
                                <input type="file" class="form-control" placeholder="COI attachment" name="coi_file">
                                <span style="color: red; font-size: 14px" id="coi_file_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>MSA Expiration Date</label>
                                <input type="date" class="form-control" id="tech_modal_msa_expire_date" placeholder="MSA expiration date" autocomplete="off" name="msa_expire_date">
                                <span style="color: red; font-size: 14px" id="msa_expire_date_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>MSA Attachment</label>
                                <input type="file" class="form-control" placeholder="MSA attachment" name="msa_file">
                                <span style="color: red; font-size: 14px" id="msa_file_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>NDA</label>
                                <select name="nda" class="form-control">
                                    <option value="">Select NDA</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                                <span style="color: red; font-size: 14px" id="nda_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>NDA Attachment</label>
                                <input type="file" class="form-control" placeholder="NDA attachment" name="nda_file">
                                <span style="color: red; font-size: 14px" id="nda_file_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Terms</label>
                                <select name="terms" class="form-control">
                                    <option value="">Select Terms</option>
                                    <option value="30">30</option>
                                    <option value="45">45</option>
                                    <option value="60">60</option>
                                    <option value="90">90</option>
                                </select>
                                <span style="color: red; font-size: 14px" id="terms_error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label>Preferred?</label>
                                <select name="preference" class="form-control">
                                    <option value="Yes">Yes</option>
                                    <option selected value="No">No</option>
                                </select>
                                <span style="color: red; font-size: 14px" id="preference_error"></span>
                            </div>
                            <div style="margin-top: 20px;">
                                <label>Skill Sets</label>
                            </div>
                            <div id="skillsContainer" class="row" style="margin-top: 10px;">

                            </div>
                            <span style="color: red; font-size: 14px" id="skill_id_error"></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <div class="d-none" id="newTechModalSpinner">
                            <button class="btn btn-warning" type="button" disabled>
                                <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
                                Please wait!!
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="d-none" id="techSearch">
                <div class="modal-body">
                    <label>Search By Id Or Name</label>
                    <div class="col-6">
                        <input type="text" class="form-control" placeholder="please start typing to search......" id="ftechAutoComplete">
                    </div>
                    <div class="d-none" id="techSearchData" style="margin-top: 40px;">
                        <h5 style="margin-top: 20px;">Technician Information</h5>
                        <div class="row">
                            <div class="form-group col-3">
                                <label>Company :</label>
                                <span id="company_name_span"></span><br>
                                <label>Adress :</label>
                                <span id="address_span"></span><br>
                                <label>Country :</label>
                                <span id="country_span"></span><br>
                                <label>City :</label>
                                <span id="city_span"></span><br>
                                <label>State :</label>
                                <span id="state_span"></span><br>
                                <label>Zipcode :</label>
                                <span id="zip_code_span"></span><br>
                                <label>Email :</label>
                                <span id="email_span"></span><br>
                                <label>Primary Contact Email :</label>
                                <span id="primary_contact_email_span"></span><br>
                            </div>
                            <div class="form-group col-3">
                                <label>Phone :</label>
                                <span id="phone_span"></span><br>
                                <label>Primary Contact :</label>
                                <span id="primary_contact_span"></span><br>
                                <label>Title :</label>
                                <span id="title_span"></span><br>
                                <label>Cell Phone :</label>
                                <span id="cell_phone_span"></span><br>
                                <label>Rate :</label>
                                <span id="rate_span"></span><br>
                                <label>Radius :</label>
                                <span id="radius_span"></span><br>
                                <label>Travel Fee :</label>
                                <span id="travel_fee_span"></span><br>
                                <label>Status :</label>
                                <span id="status_span"></span><br>
                            </div>
                            <div class="form-group col-3">
                                <label>Preference :</label>
                                <span id="preference_span"></span><br>
                                <label>COI Expire Date :</label>
                                <span id="coi_expire_date_span"></span><br>
                                <label>MSA Expire Date :</label>
                                <span id="msa_expire_date_span"></span><br>
                                <label>NDA :</label>
                                <span id="nda_span"></span><br>
                                <label>Terms :</label>
                                <span id="terms_span"></span><br>
                                <label>COI File :</label>
                                <span id="coi_file_span"></span><br>
                                <label>MSA File :</label>
                                <span id="msa_file_fee_span"></span><br>
                                <label>NDA File :</label>
                                <span id="nda_file_span"></span><br>
                            </div>
                            <h5 style="margin-top: 20px;">Skillsets</h5>
                            <span id="ftech_skills_span"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
            <div class="d-none" id="techImport">
                <div class="modal-body">
                    <form id="techImportForm" enctype="multipart/form-data">
                        @csrf
                        <div class="col-12">
                            <div class="col-6">
                                <input type="file" class="form-control" name="ftech_csv_file" id="ftech_csv_file">
                                <div class="spinner-border spinner-border-sm mt-1 d-none" role="status" id="import_spinner">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                                <span style="color: red; font-size: 14px" id="import_error_block"></span>
                            </div>
                            <div class="col-6">
                                <button type="submit" class="btn btn-primary btn-sm my-2">Submit</button>
                            </div>
                        </div>
                    </form>
                    <div class="text-center">
                        <label>Click the below button to download sample technician csv file</label><br>
                        <a href="{{ route('user.download.excel') }}" class="btn btn-primary">Download</a>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </div>
            <div class="d-none" id="techDistance">
                <div class="modal-body">
                    <form id="techDistanceForm">
                        @csrf
                        <div class="row">
                            <div class="form-group col-6">
                                <label>Provide your project site address :</label>
                                <input type="text" class="form-control" placeholder="Enter your project site address" name="destination">
                                <span style="color: red; font-size: 14px" id="destination_error"></span>
                                <span style="color: red; font-size: 14px" id="error_message_api"></span><br>
                                <span style="color: red; font-size: 14px" id="error_message_api_status"></span>
                            </div>
                            <div class="form-group col-6">
                                <div class="spinner-border spinner-border-sm d-none" role="status" id="cus_import_spinner" style="margin-top: 30px;">
                                <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>
                            <div class="form-group col-12">
                                <button type="submit" class="btn btn-warning btn-sm my-2">Find Distance</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {

        $('#techDistanceForm').on('submit',function(e){
            e.preventDefault();
            let formData = new FormData(this);

            $.ajax({
                url: "{{ route('user.tech.distance') }}",
                type: "POST",
                data:formData,
                processData: false,
                contentType: false,
                success:function(data){
                    $('#destination_error').text("");
                    console.log(data);
                    $('#error_message_api').text("Error Message : "+data.error_message);
                    $('#error_message_api_status').text("Status : "+data.status);
                },
                error:function(xhr, status, error){
                    
                    if (xhr.status === 422) {
                        $('#destination_error').text(xhr.responseJSON.errors.destination);
                    }
                }
            });
        });
        $('#techImportForm').on('submit', function(e) {
            e.preventDefault();
            let formData = new FormData(this);
            $('#import_spinner').removeClass('d-none');

            $.ajax({
                url: "{{ route('user.ftech.import') }}",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function(data) {
                    iziToast.success({
                        message: data.success,
                        position: "topRight"
                    });
                    $('#import_error_block').text("");
                    $('#import_spinner').addClass('d-none');
                    $('#ftech_csv_file').val("");
                },
                error: function(xhr, status, error) {
                    if (xhr.status === 422) {
                        $('#import_spinner').addClass('d-none');
                        $('#import_error_block').text(xhr.responseJSON.errors.ftech_csv_file);
                    }
                }
            });
        });

        //skillsets table from db for ftech reg
        function skillSets() {
            $.ajax({
                url: "{{ route('user.ftech.skills') }}",
                type: "GET",
                success: function(data) {
                    var skillsContainer = $('#skillsContainer');
                    var checkboxHtml = '';

                    data.forEach(function(skill, index) {
                        if (index % 3 === 0) {
                            checkboxHtml += '<div class="form-group col-3 text-nowrap overflow-hidden">';
                        }
                        checkboxHtml += '<div class="form-check">' +
                            '<input class="form-check-input" type="checkbox" name="skill_id[]" id="skill_' + skill.id + '" value="' + skill.id + '">' +
                            '<label class="form-check-label" for="skill_' + skill.id + '">' + skill.skill_name + '</label>' +
                            '</div>';

                        if ((index + 1) % 3 === 0 || (index + 1) === data.length) {
                            checkboxHtml += '</div>';
                        }
                    });
                    skillsContainer.html(checkboxHtml);
                }
            });
        }

        function technician(id) {
            $.ajax({
                url: "{{ route('user.ftech.data') }}",
                type: "GET",
                data: {
                    "id": id
                },
                success: function(data) {
                    if (data) {
                        $('#techSearchData').removeClass('d-none');
                    }

                    $('#company_name_span').text(data.tech.company_name);
                    $('#address_span').text(data.tech.address_data.address);
                    $('#country_span').text(data.tech.address_data.country);
                    $('#city_span').text(data.tech.address_data.city);
                    $('#state_span').text(data.tech.address_data.state);
                    $('#zip_code_span').text(data.tech.address_data.zip_code);
                    $('#email_span').text(data.tech.email);
                    $('#phone_span').text(data.tech.phone);
                    $('#primary_contact_span').text(data.tech.primary_contact);
                    $('#title_span').text(data.tech.title);
                    $('#cell_phone_span').text(data.tech.cell_phone);
                    $('#rate_span').text(data.tech.rate);
                    $('#radius_span').text(data.tech.radius);
                    $('#travel_fee_span').text(data.tech.travel_fee);
                    $('#status_span').text(data.tech.status);
                    $('#preference_span').text(data.tech.preference);
                    $('#coi_expire_date_span').text(data.tech.coi_expire_date);
                    $('#msa_expire_date_span').text(data.tech.msa_expire_date);
                    $('#nda_span').text(data.tech.nda);
                    $('#terms_span').text(data.tech.terms);
                    $('#ftech_skills_span').text(data.skills);
                },
            });
        }

        $('#ftechAutoComplete').autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "{{ route('user.technician.autocomplete') }}",
                    type: "GET",
                    dataType: "json",
                    data: {
                        "query": request.term,
                    },
                    success: function(data) {
                        response($.map(data.results, function(item) {
                            return {
                                label: item.company_name + "-" + item.technician_id,
                                value: item.company_name + "-" + item.technician_id,
                                techID: item.id,
                            }
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                var selectedTechId = ui.item.techID;
                technician(selectedTechId);
            }
        });

        $('#techNewButton').on('click', function() {
            $('#staticBackdropLabel').text("Register New Technician");
            $('#techRegistration').removeClass('d-none');
            $('#ftechSkillBlock').removeClass('d-none');
            $('#techSearch').addClass('d-none');
            $('#techImport').addClass('d-none');
            skillSets();
            $('#techDistance').addClass('d-none');
            $('#newTechnicianModal').modal('show');
        });

        $('#techSearchButton').on('click', function() {
            $('#staticBackdropLabel').text("Find Technician");
            $('#techSearch').removeClass('d-none');
            $('#techRegistration').addClass('d-none');
            $('#ftechSkillBlock').addClass('d-none');
            $('#techImport').addClass('d-none');
            $('#techDistance').addClass('d-none');
            $('#newTechnicianModal').modal('show');
        });

        $('#techImportButton').on('click', function() {
            $('#staticBackdropLabel').text("Bulk Import Technician");
            $('#techImport').removeClass('d-none');
            $('#techRegistration').addClass('d-none');
            $('#ftechSkillBlock').addClass('d-none');
            $('#techSearch').addClass('d-none');
            $('#techDistance').addClass('d-none');
            $('#newTechnicianModal').modal('show');
        });
        $('#techDistanceButton').on('click', function() {
            $('#staticBackdropLabel').text("Measure Distance Technician");
            $('#techImport').addClass('d-none');
            $('#techRegistration').addClass('d-none');
            $('#ftechSkillBlock').addClass('d-none');
            $('#techSearch').addClass('d-none');
            $('#techDistance').removeClass('d-none');
            $('#newTechnicianModal').modal('show');
        });

        $('#newTechnicianModalForm').on('submit', function(e) {
            e.preventDefault();
            $('#newTechModalSpinner').removeClass('d-none');
            let formData = new FormData(this);

            $.ajax({
                url: "{{ route('user.ftech.new') }}",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function(data) {
                    $('#newTechModalSpinner').addClass('d-none');
                    iziToast.success({
                        message: data.success,
                        position: "topRight"
                    });
                    $('#newTechnicianModalForm')[0].reset();
                },
                error: function(data) {
                    if (data.status == 422) {
                        $('#newTechModalSpinner').addClass('d-none');
                        errors = data.responseJSON.errors;
                        $("#company_name_error,#address_error,#country_error,#city_error,#state_error,#zip_code_error,#email_error,#phone_error,#primary_contact_error,#primary_contact_email_error,#title_error,#cell_phone_error,#rate_error,#radius_error,#travel_fee_error,#status_error,#coi_expire_date_error,#coi_file_error,#msa_expire_date_error,#msa_file_error,#nda_error,#nda_file_error,#terms_error,#preference_error,#skill_id_error").empty();

                        const fields = ["company_name", "address", "country", "city", "state", "zip_code", "email", "phone", "primary_contact", "primary_contact_email", "title", "cell_phone", "rate", "radius", "travel_fee", "status", "coi_expire_date", "coi_file", "msa_expire_date", "msa_file", "nda", "nda_file", "terms", "preference", "skill_id"];

                        fields.forEach(field => {
                            if (errors[field]) {
                                $('#' + field + '_error').text(errors[field]);
                            }
                        });
                    }
                }
            });
        });

        $('#techSkillsForm').on('submit', function(e) {
            e.preventDefault();

            let formData = new FormData(this);
            $.ajax({
                url: "{{ route('user.skillsets.new') }}",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function(data) {
                    $('#skillset-error').text("");
                    $("input[name='skill_name']").val("");
                    skillSets();
                    $('#success-container').text(data.message).fadeIn();
                    setTimeout(function() {
                        $('#success-container').fadeOut();
                    }, 3000);
                },
                error: function(data) {
                    $('#skillset-error').text(data.responseJSON.errors.skill_name);
                }
            });
        });
    });
</script>