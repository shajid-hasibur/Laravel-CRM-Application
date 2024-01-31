<!-- resources/views/emails/simple_email_template.blade.php -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $emailData['subject'] }}</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
            margin: 0;
        }

        .email-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333333;
            margin-bottom: 10px;
        }

        p {
            color: #555555;
            margin: 5px 0;
        }

        .content {
            border-top: 1px solid #dddddd;
            margin-top: 10px;
            padding-top: 10px;
        }

        .content p {
            color: #777777;
            margin: 10px 0;
        }

        .footer {
            margin-top: 20px;
            border-top: 1px solid #dddddd;
            padding-top: 10px;
            text-align: center;
        }

        .footer img {
            max-width: 100px;
            height: auto;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <h2>{{ $emailData['subject'] }}</h2>
        <p>From: {{ $emailData['sender'] }}</p>
        <div class="content">
            <p>{{ $emailData['body'] }}</p>
        </div>
        <div class="footer">
            <img src="https://techyeah.codetreebd.com/assetsNew/dist/img/sidelogo.png" alt="Company Logo">
            <p>Tech-Yeh INC.<br>
            123 Main Street, Cityville, USA<br>
            Phone: (123) 456-7890<br>
            Email: info@techyeahinc.com</p>
        </div>
    </div>
</body>
</html>
