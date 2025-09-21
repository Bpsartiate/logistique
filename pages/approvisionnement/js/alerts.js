// toastManager.js
$(function () {
  if ($('#globalToast').length === 0) {
    $('body').append(`
      <div id="globalToast" class="toast align-items-center text-white bg-danger border-0 position-fixed top-0 end-0 m-4" role="alert" aria-live="assertive" aria-atomic="true" style="z-index:9999; min-width:300px;">
        <div class="d-flex">
          <div class="toast-body"></div>
          <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
      </div>
    `);
  }

  window.showFormAlert = function(message, type = 'danger', duration = 3500) {
    const $toast = $('#globalToast');
    $toast.removeClass('bg-danger bg-success bg-warning bg-info bg-primary').addClass('bg-' + type);
    $toast.find('.toast-body').html(message);
    const toast = bootstrap.Toast.getOrCreateInstance($toast[0], { delay: duration });
    toast.show();
  };

  window.clearFormAlert = function() {
    const $toast = $('#globalToast');
    const toast = bootstrap.Toast.getOrCreateInstance($toast[0]);
    toast.hide();
  };
});
