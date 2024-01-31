<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body class="bg-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card mt-5">
                    <div class="card-header bg-gray">
                        <h3>Admin Register</h3>
                    </div>
                    <div class="card-body">
                        <form action="{{route('admin.postRegister')}}" method="post">
                            @csrf
                            <div class="row justify-content-center">
                                <div class="form-group col-md-6">
                                    <label for="">Name</label>
                                    <input type="text" class="form-control" name="name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="">Username</label>
                                    <input type="text" class="form-control" name="username">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="">Email</label>
                                    <input type="email" class="form-control" name="email">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="">Password</label>
                                    <input type="password" class="form-control" name="password">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="">Role</label>
                                    <select class="form-select" name="role_id" aria-label="Default select example">
                                        <option selected>Open this select menu</option>
                                        <option value="1">Project Manager</option>
                                        <option value="2">Dispatch Team</option>
                                        <option value="0">Super Admin</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary mt-3 w-100">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>