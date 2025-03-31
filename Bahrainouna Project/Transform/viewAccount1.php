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
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js">
            import Swal from 'sweetalert2/dist/sweetalert2.js'
            import 'sweetalert2/src/sweetalert2.scss'
        </script>
    </head>
    <img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="margin-left: 35%;"><br>
    <body id="formBody55"><h1 align="center">Welcome to Bahrainouna Q&A</h1><br></body>
    <?php
        try {
            $viewPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
            if (isset($_SESSION["cpr"])){
                $view = $viewPDO->prepare("Select * From Register Where CPR = ?");
                $view->execute([$_SESSION["cpr"]]);
                $user = $view->fetch();
                if (isset($user)){
    ?>
                    <script>
                        Swal.fire({
                            title: 'Success!',
                            text: 'Profile information have been retrieved successfully!',
                            icon: 'success',
                            confirmButtonText: 'Cool', 
                            draggable: true
                        });
                        console.log("User data have been retrieved from the register entity.");
                        console.time();
                    </script>
                    <table class="pico">
                        <tr>
                            <th>Name</th>
                            <td><?= $user["Name"];?></td>
                        </tr>
                        <tr>
                            <th>CPR</th>
                            <td><?= $user["CPR"];?></td>
                        </tr>
                        <tr>
                            <th>Date of Birth</th>
                            <td><?= $user["DOB"];?></td>
                        </tr>
                        <tr>
                            <th>Age</th>
                            <td><?= $user["Age"];?></td>
                        </tr>
                        <tr>
                            <th>Last User Created On</th>
                            <td><?= $user["History"];?></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><?= $user["Email"];?></td>
                        </tr>
                        <tr>
                            <th>TelNum</th>
                            <td><?= $user["TelNum"];?></td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td><?= $user["Password"];?></td>
                        </tr>
                    </table>
    <?php
                }
                else {
    ?>
                    <script> 
                        Swal.fire({
                            title: 'Error!',
                            text: 'Failed to get profile information. Profile not found!',
                            icon: 'error',
                            confirmButtonText: 'OK',
                            draggable: true
                        });
                        console.error("There's a bug when getting information about the user.");
                        console.info("I bet that there's a problem from data retrieval from the database.");
                    </script>
    <?php
                }
            }
            else {
    ?>
                <div class="pico">
                    <form action="viewUser.php" method="get">
                        <br><label for="viewProfile">Enter your CPR: </label>
                        <input type="text" name="viewProfile" id="vProfile1" placeholder="Must be 9 digits">
                        <br><input type="submit" name="theSubmission" id="pSubmit77" value="Confirm">
                    </form>
                </div><br>
    <?php
                if (isset($_GET["viewProfile"]) && isset($_GET["theSubmission"])){
                    $view = $viewPDO->prepare("Select * From Register Where CPR = :cpr");
                    $view->bindParam(":cpr", $_SESSION["cpr"]);
                    $view->execute();
                    $user = $view->fetch();
                    if (isset($user)){
    ?>
                        <script>
                            Swal.fire({
                                title: 'Success!',
                                text: 'Profile information have been retrieved successfully!',
                                icon: 'success',
                                confirmButtonText: 'Cool', 
                                draggable: true
                            });
                            console.log("User data have been retrieved from the register entity.");
                            console.time();
                        </script>
                        <table class="pico">
                            <tr>
                                <th>Name</th>
                                <td><?= $user["Name"];?></td>
                            </tr>
                            <tr>
                                <th>CPR</th>
                                <td><?= $user["CPR"];?></td>
                            </tr>
                            <tr>
                                <th>Date of Birth</th>
                                <td><?= $user["DOB"];?></td>
                            </tr>
                            <tr>
                                <th>Age</th>
                                <td><?= $user["Age"];?></td>
                            </tr>
                            <tr>
                                <th>Last User Created On</th>
                                <td><?= $user["History"];?></td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td><?= $user["Email"];?></td>
                            </tr>
                            <tr>
                                <th>TelNum</th>
                                <td><?= $user["TelNum"];?></td>
                            </tr>
                            <tr>
                                <th>Password</th>
                                <td><?= $user["Password"];?></td>
                            </tr>
                        </table>
    <?php
                    }
                    else {
    ?>
                        <script> 
                            Swal.fire({
                                title: 'Error!',
                                text: 'Failed to get profile information. Profile not found!',
                                icon: 'error',
                                confirmButtonText: 'OK',
                                draggable: true
                            });
                            console.error("There's a bug when getting information about the user.");
                            console.info("I bet that there's a problem from data retrieval from the database.");
                        </script>
    <?php
                    }
                }
            }
        }
        catch(PDOException $e){
    ?>
            <script>
                Swal.fire({
                    title: 'Error!',
                    text: 'There is a problem in the database.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
                console.error("There's a bug in the code. Check it!");
                console.info("The error came from the database.");
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