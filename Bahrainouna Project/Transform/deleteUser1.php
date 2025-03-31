<?php
    require("personClass.php");
    require("registerClass.php");
    require("loginClass.php");
    include("dataStructure.php");
    include("listForAll.php");
    include("register2.php");
    include("login2.php");
    include("createUser1.php");
    include("main2.php");
?>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0">
        <title>Login to Bahrainouna Q&A!</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js">
            import Swal from 'sweetalert2'
        </script>
    </head>
    <img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="margin-left: 35%;"><br>
    <body id="formBody55"><h1 align="center">Welcome to Bahrainouna Q&A</h1><br></body>
    <?php
        try {
            $deletePDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
            $deleteStatement1 = $deletePDO->prepare("Delete From Register Where CPR = ?");
            $deleteStatement2 = $deletePDO->prepare("Delete From Login Where CPR = ?)");
            $deleteStatement1->execute([$_SESSION["cpr"]]);
            $deleteStatement2->execute([$_SESSION["cpr"]]);
            if ($deleteStatement1->rowCount() > 0 && $deleteStatement2->rowCount() > 0):
    ?>
                <script>
                    Swal.fire({
                        title: 'Success!',
                        text: 'Your account have been successfully deleted!',
                        icon: 'success',
                        confirmButtonText: 'Cool', 
                        draggable: true
                    });
                    console.warn("Data have been removed from Registered and Login entities.");
                    console.time();
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
                    console.log("The current screen display will be pointed to login page.");
                </script>
    <?php
                $_SESSION = array();
                session_destroy();
                header("Location: login2.php");
                exit();
            else:
    ?>
                <script>
                    Swal.fire({
                        title: 'Error!',
                        text: 'Failed to add a new form to the list.',
                        icon: 'error',
                        confirmButtonText: 'OK',
                        draggable: true
                    });
                    console.error("Data have not been removed from Register and Login entities.");
                    console.info("The account was not found in both register and login entities.");
                    console.log("I bet the account CPR from session array is different than any other CPR in the database.");
                </script>
    <?php
            endif;
        }
        catch(PDOException $e){
    ?>
            <script>
                Swal.fire({
                    title: 'Error!',
                    text: 'There is a problem in the database.',
                    icon: 'error',
                    confirmButtonText: 'OK', 
                    draggable: true
                });
                console.error("There's a bug in the code. Check it!");
            </script>
    <?php
            echo "Result: ".$e->getMessage()."<br>";
        }
        catch(Exception $e){
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
            echo "Result: ".$e->getMessage()."<br>";
        }
    ?>
</html>