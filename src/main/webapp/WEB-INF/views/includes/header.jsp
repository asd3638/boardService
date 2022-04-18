<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>스프링 게시판 구현하기</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


</head>
<body>
    <style>
        @font-face {
            font-family: 'KyoboHandwriting2020A';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/KyoboHandwriting2020A.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        body {
            padding: 5%;
            font-family: 'KyoboHandwriting2020A';
        }
        .page-item.active .page-link {
            z-index: 3;
            color: #fff;
            background-color: burlywood;
            border-color: burlywood;
        }
        .page-link {
            color: burlywood;
        }
        .page-link:hover {
            color: burlywood;
        }
        .form-control[readonly] {
            background-color: antiquewhite;
        }
        .btn-primary {
            color: #fff;
            background-color: burlywood;
            border-color: burlywood;
        }
        .btn-default {
            color: #fff;
            background-color: burlywood;
            border-color: burlywood;
        }
        .btn-danger {
            color: #fff;
            background-color: darksalmon;
            border-color: darksalmon;
        }
        .btn-info {
            color: white;
            background-color: lightsteelblue;
            border-color: lightsteelblue;
        }
        .btn-default:hover {
            color: black;
            background-color: antiquewhite;
            border-color: antiquewhite;
        }
        .btn-primary:hover {
            color: black;
            background-color: antiquewhite;
            border-color: antiquewhite;
        }
        .btn-danger:hover {
            color: black;
        }
        .btn-info:hover {
            color: black;
            background-color: #2c4762;
            border-color: #2c4762;
        }
    </style>
</body>
