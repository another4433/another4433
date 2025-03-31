<?php
    include("register2.php");
    include("login2.php");
?>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0">
        <title>Bahrainouna Q&A!</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js">
            import Swal from 'sweetalert2'
        </script>
    </head>
    <body>
        <h1 align="center">Welcome to Bahrainouna Q&A</h1><br>
        <h4 align="center">Choose an option below to start action in this website: </h4>
        <div class="container">
            <form action="main2.php" method="get">
                <label for="optionSelector"></label>
                <input type="radio" name="optionSelector" value="create form">Create Form 
                <br><input type="radio" name="optionSelector" value="edit form">Edit Form 
                <br><input type="radio" name="optionSelector" value="delete form">Delete Form 
                <br><input type="radio" name="optionSelector" value="show form">Show Form
                <br><input type="radio" name="optionSelector" value="show form questions only">Show Form Questions Only  
                <br><input type="radio" name="optionSelector" value="show form answers only">Show Form Answers Only 
                <br><input type="radio" name="optionSelector" value="show form corrections only">Show Form Corrections Only
                <br><input type="radio" name="optionSelector" value="edit account">Edit Account 
                <br><input type="radio" name="optionSelector" value="delete account">Delete Account 
                <br><input type="radio" name="optionSelector" value="view account">View Account 
                <br><input type="radio" name="optionSelector" value="quiz yourself">Quiz Yourself
                <br><input type="radio" name="optionSelector" value="logout">Logout 
                <br><input type="radio" name="optionSelector" value="cancel">Cancel 
                <br><input type="submit" name="verify" value="Confirm">
            </form>
        </div><br>
        <p class="pico">
            This website is allowing users to post questions about Bahrain tradition. <br>
            The users can test themeselves to determine their knowledge about Bahrain tradition. <br>
            The questions that will be posted by the users should fit the theme of Bahrain tradition. <br>
        </p><br>
    </body><br>
    <footer>
        <header class="pico">Contact Details</header><br>
        <table class="pico">
            <tr>
                <th>Name</th>
                <td>Ali Mohamed Ali</td>
            </tr>
            <tr>
                <th>Location</th>
                <td>Bahrain</td>
            </tr>
            <tr>
                <th>Email</th>
                <tr><a href="mailto:alimohamedhassan9@outlook.com">alimohamedhassan9@outlook.com</a></tr>
            </tr>
            <tr>
                <th rowspan="3">Social Media</th>
                <tr>
                    <td><button><a href="https://www.instagram.com/aqwe443346/?hl=en">Instagram</a></button></td>
                    <td><button><a href="https://www.tiktok.com/@aqweandalihassan">TikTok</a></button></td>
                    <td><button><a href="https://twitter.com/AnotherAqwe">Twitter/X</a></button></td>
                </tr>
            </tr>
        </table>
    </footer>
</html>
<?php
    try {
        if (isset($_GET["optionSelector"]) && isset($_GET["verify"]) && $_GET["verify"] == "Confirm"){
            switch($_GET["optionSelector"]){
                case "create form": 
                    header("Location: createForm1.php");
                    break;
                case "delete form": 
                    header("Location: deleteForm1.php");
                    break;
                case "edit form":
                    header("Location: editForm1.php");
                    break;
                case "show form": 
                    header("Location: showForm1.php");
                    break;
                case "show form questions only":
                    header("Location: showFormQuestions.php");
                    break;
                case "show form answers only":
                    header("Location: showFormAnswers.php");
                    break;
                case "show form corrections only":
                    header("Location: showFormCorrections.php");
                    break;
                case "edit account":
                    header("Location: editAccount1.php");
                    break;
                case "delete account":
                    header("Location: deleteAccount1.php");
                    break;
                case "view account": 
                    header("Location: viewAccount1.php");
                    break;
                case "quiz yourself":
                    header("Location: formQuiz.php");
                    break;
                case "logout": {
                    $logPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                    $myLog = $logPDO->prepare("Delete From Login Where CPR = ?");
                    $myLog->execute([$_SESSION["cpr"]]);
?>
                    <script>
                        Swal.fire({
                            title: 'Success!',
                            text: 'You have logged out from the website.',
                            icon: 'success',
                            confirmButtonText: 'Cool', 
                            draggable: true
                        });
                        console.warn("The session have been destroyed.");
                        console.time();
                        alert("Heading back to login page!");
                        let timerInterval;
                        Swal.fire({
                            title: "Redirecting...",
                            icon: 'info',
                            html: "Heading back to login page in <b></b> milliseconds.",
                            timer: 2000,
                            timerProgressBar: true,
                            draggable: true,
                            didOpen: () => {
                                Swal.showLoading();
                                const timer = Swal.getPopup().querySelector("b");
                                timerInterval = setInterval(() => {
                                    timer.textContent = `${Swal.getTimerLeft()}`;
                                }, 100);
                            },
                            willClose: () => {
                                clearInterval(timerInterval);
                            }
                        }).then((result) => {
                            if (result.dismiss === Swal.DismissReason.timer) {
                                console.log("Returned back to login page.");
                            }
                        });
                        console.log("The current screen displayed is going to point to login page");
                    </script>
<?php
                    if (isset($_SESSION) || isset($_SESSION["cpr"])){
                        $_SESSION["cpr"] = null;
                        session_unset();
                        session_destroy();
                    }
                    header("login2.php");
                    exit();
                }
                default: header("Location: main2.php");
            }
        }
    }
    catch (Exception $exception){
?>
        <script>
            Swal.fire({
                title: 'Error!',
                text: 'There is a problem in the application.',
                icon: 'error',
                confirmButtonText: 'OK', 
                draggable: true
            });
            console.error("There's a bug in the code. Check it!");
        </script>
<?php
    }
?>