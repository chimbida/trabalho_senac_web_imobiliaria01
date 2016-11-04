<footer class="page-footer  green">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Imobiliaria</h5>
                <p class="grey-text text-lighten-4">O maior shopping de imóveis do Brasil</p>


            </div>
            <div class="col l3 s12">
                <h5 class="white-text">Links</h5>
                <ul>
                    <li><a class="white-text" href="#!">Link 1</a></li>
                    <li><a class="white-text" href="#!">Link 2</a></li>
                    <li><a class="white-text" href="#!">Link 3</a></li>
                    <li><a class="white-text" href="#!">Link 4</a></li>
                </ul>
            </div>
            <div class="col l3 s12">
                <h5 class="white-text">Social</h5>
                <ul>
                    <li><a class="white-text" href="#!">Link 1</a></li>
                    <li><a class="white-text" href="#!">Link 2</a></li>
                    <li><a class="white-text" href="#!">Link 3</a></li>
                    <li><a class="white-text" href="#!">Link 4</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            Made by <a class="brown-text text-lighten-3" href="http://materializecss.com">Materialize</a>
        </div>
    </div>
</footer>


<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="<c:url value="/resources/js/materialize.js" />"></script>
<script src="<c:url value="/resources/js/init.js" />"></script>
<script src="<c:url value="/resources/js/jquery.cookie.min.js" />"></script>
<script src="<c:url value="/resources/js/checkcookie.js" />"></script>

<script>
    $(document).ready(function() {
        $('select').material_select();
    });
    $(document).ready(function(){
        $('.tooltipped').tooltip({delay: 50});
    });
</script>

</body>
</html>