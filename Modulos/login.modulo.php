<div class="container bk" style="margin-top: 10%;">
    <div class="row">
        <div class="col m6">
            <h2>Bienvenido</h2>
            <img src="logo.png" height="100%" width="100%">
        </div>
        <div class="col m6">
            <h2 class="center-align">Login</h2>
            <div class="row">
                <form class="col s12" id="login" action="usrp.php" method="POST">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="email" type="text" name="alias" class="validate">
                            <label for="email">Alias</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="pass" name="pass" type="password" class="validate">
                            <label for="pass">Password</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <p>
                                <input type="checkbox" id="remember">
                                <label for="remember">Remember me</label>
                            </p>
                        </div>
                    </div>
                    <div class="divider"></div>
                    <div class="row">
                        <div class="col m12">
                            <p class="right-align">
                                <button class="btn btn-large waves-effect waves-light" type="submit" name="action">Login</button>
                            </p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>