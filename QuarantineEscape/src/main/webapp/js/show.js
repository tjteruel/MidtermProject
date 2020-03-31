try{Typekit.load({ async: true });}catch(e){}

    $(function () {
        function getParameterByName(name, url) {
                if (!url) {
                  url = window.location.href;
                }
                name = name.replace(/[\[\]]/g, "\\$&");
                var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                    results = regex.exec(url);
                if (!results) return null;
                if (!results[2]) return '';
                return decodeURIComponent(results[2].replace(/\+/g, " "));
            }
            if(getParameterByName('email') == "success"){
                //make message permanent
                // alert("Contact was made!\nWe will get back to you as soon as possible.");
                document.getElementById("mailer").style.pointerEvents = "none";
                document.getElementById("mailer").style.filter= "blur(2px)";
                document.getElementById("contactwas").style.display = "block";
                //clear url

            }
        });