<?php
    include("dataStructure.php");
    require("formClass.php");
    require("personClass.php");
    require("registerClass.php");
    include("register2.php");
    include("login2.php");
    require("listForAll.php");
    include("createForm1.php");
    include("editForm1.php");
    include("deleteForm1.php");
    include("correctClass.php");
    include("questionClass.php");
    include("answerClass.php");

    function subString($theString, $start, $end){
        if ($start === $end){
            return false;
        }
        elseif ($start > $end){
            $temp = $start;
            $start = $end;
            $end = $temp;
        }
        $myString = "";
        for ($i = $start; $i < $end; $i++){
            $myString += $theString[$i];
        }
        return $myString;
    }
    function getIndex($string, $char){
        foreach($string as $item){
            $index = 0;
            if ($item === $char){
                return $index;
            }
            else {
                $index++;
            }
        }
        return -1;
    }
    function getLastIndex($string, $char){
        $length = 0;
        while ($string[$length] != null){
            $length++;
        }
        for ($i = $length-1; $i > 0; $i--){
            if ($string[$i] === $char){
                return $i;
            }
        }
        return $length;
    }
?>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0">
        <title>Login to Bahrainouna Q&A!</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js">
            import Swal from 'sweetalert2'
        </script>
    </head>
    <body>
        <h1 align="center">Welcome to Bahrainouna Q&A</h1><br>
        <?php
            try {
                echo "<header>List of form names:<header><br>";
                for ($i = 0; $i < $listForAll->columnSize("form"); $i++){
                    $itemFromArray = $listForAll->get("form", $i);
                    $formReference = new Form($itemFromArray->getName(), $itemFromArray->getOwner());
                    echo $formReference->getFormID().". ".$formReference->getFormName()."<br>";
                }
                echo "<br>";
        ?>
                <div class="container">
                    <form action="showForm1.php" method="get">
                        <label for="formSelector">Enter the name of the form: </label>
                        <input type="text" name="formSelector" placeholder="The name of the forms are displayed above for you to select">
                        <br><input type="button" name="back" value="Back">
                        <input type="submit" name="submit" value="Confirm">
                    </form>
                </div><br>
        <?php
                if (isset($_GET["formSelector"]) && isset($_GET["submit"])){
                    $pdo = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                    $stmt = $pdo->prepare("SELECT * FROM Register WHERE CPR = ? AND Email = ? AND Password = ?");
                    $stmt->execute([$_SESSION["cpr"], $_SESSION["email"], $_SESSION["password"]]);
                    $theOwner = $stmt->fetch();
                    if (isset($theOwner)){
                        $theYear = subString($theOwner["DOB"], 0, getIndex($theOwner["DOB"], '-'));
                        $theMonth = subString($theOwner["DOB"], getIndex($theOwner["DOB"], '-'), getLastIndex($theOwner["DOB"], '-'));
                        $theDay = subString($theOwner["DOB"], getLastIndex($theOwner["DOB"], '-'), getLastIndex($theOwner["DOB"], '%#')-1);
                        $owner = new PhpRegister($theOwner["Name"], $_SESSION["cpr"], $theOwner["TelNum"], $theDay, $theMonth, $theYear, $_SESSION["email"], $_SESSION["password"]);
                        $formReference = new Form($_GET["formSelector"], $owner);
                        echo "<label>List of Corrections: </label><br>";
                        for ($i = 0; $i < $formReference->getSizeCorrections(); $i++){
                            echo $formReference->getCorrect($i);
                        }
                    }
                    else {
        ?>
                        <script>
                            Swal.fire({
                                title: 'Error!',
                                text: 'Failed to look for the form due to account finding issue.',
                                icon: 'error',
                                confirmButtonText: 'OK', 
                                draggable: true
                            });
                            console.error("The owner variable wasn't set that caused the error when doing $stmt->fetch();.");
                        </script>
        <?php
                    }
                }
                elseif (isset($_GET["back"])){
                    header("Location: main2.php");
                    exit();
                }
            }
            catch(Exception $exception){
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
                echo "Result: ".$exception->getMessage()."<br>";
            }
        ?>
    </body>
</html>