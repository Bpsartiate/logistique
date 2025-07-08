<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Gestion du Plan d'Approvisionnement</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="assets/js/config.js"></script>
    <script src="vendors/simplebar/simplebar.min.js"></script>


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link href="assets/css/theme-rtl.min.css" rel="stylesheet" id="style-rtl">
    <link href="assets/css/theme.min.css" rel="stylesheet" id="style-default">
    <link href="assets/css/user-rtl.min.css" rel="stylesheet" id="user-style-rtl">
    <link href="assets/css/user.min.css" rel="stylesheet" id="user-style-default">
    <script>
      var isRTL = JSON.parse(localStorage.getItem('isRTL'));
      if (isRTL) {
        var linkDefault = document.getElementById('style-default');
        var userLinkDefault = document.getElementById('user-style-default');
        linkDefault.setAttribute('disabled', true);
        userLinkDefault.setAttribute('disabled', true);
        document.querySelector('html').setAttribute('dir', 'rtl');
      } else {
        var linkRTL = document.getElementById('style-rtl');
        var userLinkRTL = document.getElementById('user-style-rtl');
        linkRTL.setAttribute('disabled', true);
        userLinkRTL.setAttribute('disabled', true);
      }
    </script>
  </head>


  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="container-fluid" data-layout="container-fluid">
        <script>
          var isFluid = JSON.parse(localStorage.getItem('isFluid'));
          if (isFluid) {
            var container = document.querySelector('[data-layout]');
            container.classList.remove('container');
            container.classList.add('container-fluid');
          }
        </script>
       <!-- nav prime  -->
        <?php include_once "sidebar.php"; ?>
        <!-- content -->
       <?php include_once "./pages/approvisionnement/approvisionnement.php"; ?>
       <!-- modal section -->
        <?php include_once "modal.php"; ?>
      </div>
    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->

<!-- setting button -->
 <?php include_once "settings.php"; ?>


    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="vendors/popper/popper.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
    <script src="vendors/anchorjs/anchor.min.js"></script>
    <script src="vendors/is/is.min.js"></script>
    <script src="vendors/echarts/echarts.min.js"></script>
    <script src="vendors/fontawesome/all.min.js"></script>
    <script src="vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="vendors/list.js/list.min.js"></script>
    <script src="assets/js/theme.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="vendors/echarts/echarts.min.js"></script>
    <script src="./pages/approvisionnement/procedure_recommandee.js"></script>
    <script>
        $(document).ready(function() {
  // Le spinner est visible, le graphique caché (défini dans le HTML)

  // Simuler un petit délai pour l'effet de chargement (optionnel)
  setTimeout(function() {
    var chartDom = document.getElementById('evaluationChart');
    var myChart = echarts.init(chartDom);

    var option = {
      title: { text: 'Graphique d’évaluation Fournisseur', left: 'center' },
      tooltip: {},
      radar: {
        indicator: [
          { name: 'Qualité', max: 100 },
          { name: 'Délais', max: 100 },
          { name: 'Service', max: 100 },
          { name: 'Conformité', max: 100 },
          { name: 'Communication', max: 100 }
        ]
      },
      series: [{
        type: 'radar',
        data: [{
          value: [95, 90, 92, 88, 85],
          name: 'Société Alpha',
          areaStyle: { opacity: 0.2 }
        }]
      }]
    };

    myChart.setOption(option);

    // Masquer le spinner avec un fondu puis le supprimer, afficher le graphique
    $('#loader2').fadeOut(300, function() {
      $(this).remove(); // Supprime le div du DOM
      $('#evaluationChart').fadeIn(300);
      myChart.resize(); // Assure le bon affichage du graphique
    });
  }, 500); // 500ms pour l'effet visuel, ajuste ou retire selon besoin
});
</script>
  </body>

</html>