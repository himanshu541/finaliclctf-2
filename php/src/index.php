<?php
// index.php for /php directory

// Set content type to HTML
header("Content-Type: text/html");

// Display the introduction message
echo "<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <!--Your key = ./key4.txt -->
    <title>PHP Satellite</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('background.webp') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 20px;
            color: #fff;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        h1 {
            color: #fff;
        }
        p {
            line-height: 1.6;
        }
        .resistance {
            background: rgba(248, 215, 218, 0.9);
            border-left: 5px solid #dc3545;
            padding: 15px;
            margin-bottom: 20px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class='container'>
        <h1>Welcome to PHP Satellite</h1>
        <div class='resistance'>
            <p>You tread dangerous ground, intruder. The commands you issue may unleash unforeseen consequences. Proceed with caution, but know that each command could trigger a chain reaction. Uncover the secrets hidden beneath the surface if you dare.</p>
        </div>
    </div>
</body>
</html>";
?>
