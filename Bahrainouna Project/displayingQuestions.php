<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width; initial-scale=1.0">
        <title>Displaying Questions</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
    </head>
    <body>
        <table class="pico">
            <tr>
                <th>Question</th>
                <th>Form ID referred to</th>
            </tr>
            <?php
                try {
                    $displayPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                    $displayResults = $displayPDO->query("Select * From Questions");
                    foreach ($displayResults as $row):
            ?>
                        <tr>
                            <td><?= $row['theSpecific']; ?></td>
                            <td><?= $row['OwnerForm']; ?></td>
                        </tr>
            <?php
                    endforeach;
                }
                catch(PDOException $e){
            ?>
                    <script>
                        alert("There's an error in the database.");
                        console.error("There's a bug in the code. Check it!");
                    </script>
            <?php
                    echo "Result: ".$e->getMessage();
                }
            ?>
        </table>
    </body>
</html>