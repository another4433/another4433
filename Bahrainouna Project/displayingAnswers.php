<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width; initial-scale=1.0">
        <title>Displaying Questions</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
    </head>
    <body>
        <table class=pico>
            <tr>
                <th>ID</th>
                <th>Key</th>
                <th>Detail</th>
                <th>Form ID referred to</th>
                <th>Question ID referred to</th>
            </tr>
            <?php
                try {
                    $displayPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                    $displayAnswers = $displayPDO->query("Select * From Answers");
                    foreach ($displayAnswers as $line):
            ?>
                        <tr>
                            <td><?= $line["ID"]; ?></td>
                            <td><?= $line["theKey"]; ?></td>
                            <td><?= $line["Detail"]; ?></td>
                            <td><?= $line["OwnerForm"]; ?></td>
                            <td><?= $line["ReferQA"]; ?></td>
                        </td>
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