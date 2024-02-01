<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered">
      <div class="modal-content ">
        <div class="modal-header bg-gray ">
          <h5 class="modal-title " id="staticBackdropLabel">Assign This Technician</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="user_dispatch_form">
            @csrf
            <input type="hidden" name="ftech_id" id="assign_modal_ftech_id">
            <input type="hidden" name="workOrderId" id="assign_modal_workOrderId">
            <div class="d-flex">
              <h5>Company Name :&nbsp;</h5>
              <h5 id="assign_modal_company_name" class="ml-2"></h5>
            </div>
            <div class="d-flex">
              <h5>Technician ID :&nbsp;</h5>
              <h5 id="assign_modal_tech_id" class="ml-2">dfvdfvsdfvd</h5>
            </div>
            <div class="d-flex">
              <h5>Status :&nbsp;</h5>
              <h5 id="assign_modal_status" class="ml-2">Active</h5>
            </div>
            <hr>
            <div class="d-flex">
              <button type="submit" class="btn btn-primary">Assign</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>