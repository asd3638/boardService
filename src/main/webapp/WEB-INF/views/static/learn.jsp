<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="icons.html"> Icons</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grid</a>
                                </li>
                            </ul>

                            <!-- /.nav-second-level -->

                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>



        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Learning Page</h1>
                </div>
                <!--             /card1 -->
		           <div class="col-lg-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading" style = "font-size:20px">
		                            ${crawlingInfo[0].name}
		                        </div>
		                        <div class="panel-body">
		                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
		                        </div>
		                        <a class="btn btn-primary btn-lg" role="button" style = "width : 100px; height : 30px; font-size: 10px; margin-bottom:5px; margin-left:5px">Learn more</a>
		                    </div>
		                </div>
<!--             /card -->
<!--             /card2 -->
		           <div class="col-lg-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            ${crawlingInfo[4].name}
		                        </div>
		                        <div class="panel-body">
		                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
		                        </div>
		                        <a class="btn btn-primary btn-lg" role="button" style = "width : 100px; height : 30px; font-size: 10px; margin-bottom:5px; margin-left:5px">Learn more</a>
		                    </div>
		                </div>
<!--             /card -->
<!--             /card3 -->
		           <div class="col-lg-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            ${crawlingInfo[8].name}
		                        </div>
		                        <div class="panel-body">
		                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
		                        </div>
		                        <a class="btn btn-primary btn-lg" role="button" style = "width : 100px; height : 30px; font-size: 10px; margin-bottom:5px; margin-left:5px">Learn more</a>
		                    </div>
		                </div>
<!--             /card -->
<!--             /card4 -->
		           <div class="col-lg-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            ${crawlingInfo[12].name}
		                        </div>
		                        <div class="panel-body">
		                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
		                        </div>
		                        <a class="btn btn-primary btn-lg" role="button" style = "width : 100px; height : 30px; font-size: 10px; margin-bottom:5px; margin-left:5px">Learn more</a>
		                    </div>
		                </div>
<!--             /card -->
<!--             /card5 -->
		           <div class="col-lg-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            ${crawlingInfo[16].name}
		                        </div>
		                        <div class="panel-body">
		                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
		                        </div>
		                        <a class="btn btn-primary btn-lg" role="button" style = "width : 100px; height : 30px; font-size: 10px; margin-bottom:5px; margin-left:5px">Learn more</a>
		                    </div>
		                </div>
<!--             /card -->
<!--             /card6 -->
		           <div class="col-lg-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                           ${crawlingInfo[20].name}
		                        </div>
		                        <div class="panel-body">
		                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
		                        </div>
		                        <a class="btn btn-primary btn-lg" role="button" style = "width : 100px; height : 30px; font-size: 10px; margin-bottom:5px; margin-left:5px">Learn more</a>
		                    </div>
		                </div>
<!--             /card -->
<!--             /card7 -->
		           <div class="col-lg-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            ${crawlingInfo[24].name}
		                        </div>
		                        <div class="panel-body">
		                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
		                        </div>
		                       <a class="btn btn-primary btn-lg" role="button" style = "width : 100px; height : 30px; font-size: 10px; margin-bottom:5px; margin-left:5px">Learn more</a>
		                    </div>
		                </div>
<!--             /card -->
<!--             /card8 -->
		           <div class="col-lg-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            ${crawlingInfo[28].name}
		                        </div>
		                        <div class="panel-body">
		                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
		                        </div>
		                        <a class="btn btn-primary btn-lg" role="button" style = "width : 100px; height : 30px; font-size: 10px; margin-bottom:5px; margin-left:5px">Learn more</a>
		                    </div>
		                </div>
<!--             /card -->
<!--             /card9 -->
		           <div class="col-lg-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            ${crawlingInfo[32].name}
		                        </div>
		                        <div class="panel-body">
		                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
		                        </div>
		                        <a class="btn btn-primary btn-lg" role="button" style = "width : 100px; height : 30px; font-size: 10px; margin-bottom:5px; margin-left:5px">Learn more</a>
		                    </div>
		                </div>
<!--             /card -->
<!--             /card10 -->
		           <div class="col-lg-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                           ${crawlingInfo[36].name}
		                        </div>
		                        <div class="panel-body">
		                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
		                        </div>
		                        
		                          <a class="btn btn-primary btn-lg" role="button" style = "width : 100px; height : 30px; font-size: 10px; margin-bottom:5px; margin-left:5px">Learn more</a>

		                    </div>
		                </div>
<!--             /card -->
            </div>

                
        </div>
            <!-- /.row -->
           
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
    
    <script src="/resources/vendor/raphael/raphael.min.js"></script>
    <script src="/resources/vendor/morrisjs/morris.min.js"></script>
    <script src="/resources/data/morris-data.js"></script>

</body>

</html>

