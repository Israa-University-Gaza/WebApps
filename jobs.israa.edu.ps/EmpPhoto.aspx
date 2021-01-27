<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage.master" AutoEventWireup="true" CodeFile="EmpPhoto.aspx.cs" Inherits="Administrator_EmpPhoto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <link href="../assets/global/plugins/cubeportfolio/css/cubeportfolio.css" rel="stylesheet" type="text/css"/>

    <div id="js-grid-juicy-projects" class="cbp">
        <asp:Repeater ID="Repeater" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>

                            <div class="cbp-item graphic">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                      
                                        <img src= '<%# "http://jobs.israa.edu.ps/Administrator/ShowImage_p.ashx?id="+Eval("emp_id") %>'  alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">

                                                <a href='<%# "ShowData.aspx?id="+Eval("emp_id") %>'
                                                     class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase btn red uppercase" rel="nofollow">السيرة الذاتية</a>
                                                <a href='<%# "http://jobs.israa.edu.ps/Administrator/ShowImage_p.ashx?id="+Eval("emp_id") %>' class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase btn red uppercase"
                                                     data-title="Dashboard<br>by Paul Flavius Nechita">عرض اكبر</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center uppercase text-center"><%# Eval("الاسم") %></div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center uppercase text-center"><%# Eval("المؤهل") %> / <%# Eval("التخصص") %></div>
                            </div>
                          
    </ItemTemplate>
                            </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT emp_id,dbo.full_name(emp_id)الاسم ,dbo.cer_type(emp_id) المؤهل,dbo.cer_name(emp_id) التخصص FROM [hr_emp_p_img]">
        <SelectParameters>
            <asp:Parameter DefaultValue="IUJASv1i1" Name="jor" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
<%--                            <div class="cbp-item web-design logos">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="../assets/global/img/portfolio/600x600/05.jpg" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <a href="../assets/global/plugins/cubeportfolio/ajax/project2.html" class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase btn red uppercase" rel="nofollow">more info</a>
                                                <a href="../assets/global/img/portfolio/1200x900/50.jpg" class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase btn red uppercase" data-title="World Clock Widget<br>by Paul Flavius Nechita">view larger</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center">World Clock Widget</div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center">Logo / Web Design</div>
                            </div>
                            <div class="cbp-item graphic logos">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="../assets/global/img/portfolio/600x600/16.jpg" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <a href="../assets/global/plugins/cubeportfolio/ajax/project1.html" class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase btn red uppercase" rel="nofollow">more info</a>
                                                <a href="http://vimeo.com/14912890" class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase btn red uppercase" data-title="To-Do Dashboard<br>by Tiberiu Neamu">view video</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center">To-Do Dashboard</div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center">Graphic / Logo</div>
                            </div>

                            <div class="cbp-item web-design graphic">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="../assets/global/img/portfolio/600x600/33.jpg" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <a href="../assets/global/plugins/cubeportfolio/ajax/project2.html" class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase btn red uppercase" rel="nofollow">more info</a>
                                                <a href="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/4900333&amp;auto_play=true&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"
                                                    class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase btn red uppercase" data-title="Events and  More<br>by Tiberiu Neamu">view sound</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center">Events and More</div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center">Web Design / Graphic</div>
                            </div>

                            <div class="cbp-item identity web-design">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="../assets/global/img/portfolio/600x600/38.jpg" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <a href="../assets/global/plugins/cubeportfolio/ajax/project1.html" class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase btn red uppercase" rel="nofollow">more info</a>
                                                <a href="../assets/global/img/portfolio/1200x900/4.jpg" class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase btn red uppercase" data-title="WhereTO App<br>by Tiberiu Neamu">view larger</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center">Where To App</div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center">Web Design / Identity</div>
                            </div>
                            <div class="cbp-item identity web-design">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="../assets/global/img/portfolio/600x600/88.jpg" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <a href="../assets/global/plugins/cubeportfolio/ajax/project2.html" class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase btn red uppercase" rel="nofollow">more info</a>
                                                <a href="../assets/global/img/portfolio/1200x900/7.jpg" class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase btn red uppercase" data-title="Ski * Buddy<br>by Tiberiu Neamu">view larger</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center">Ski * Buddy</div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center">Identity / Web Design</div>
                            </div>

                            <div class="cbp-item graphic logos">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="../assets/global/img/portfolio/600x600/02.jpg" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <a href="../assets/global/plugins/cubeportfolio/ajax/project1.html" class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase" rel="nofollow">more info</a>
                                                <a href="../assets/global/img/portfolio/1200x900/60.jpg" class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase" data-title="Seemple* Music for iPad<br>by Tiberiu Neamu">view sound</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center uppercase text-center">Seemple* Music for iPad</div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center">Graphic / Logo</div>
                            </div>
                            <div class="cbp-item identity graphic">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="../assets/global/img/portfolio/600x600/62.jpg" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <a href="../assets/global/plugins/cubeportfolio/ajax/project2.html" class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase" rel="nofollow">more info</a>
                                                <a href="http://www.youtube.com/watch?v=Bu9OiDmxCrQ" class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase" data-title="Remind~Me More<br>by Tiberiu Neamu">view video</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center">Remind~Me More</div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center">Identity / Graphic</div>
                            </div>

                            <div class="cbp-item web-design graphic">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="../assets/global/img/portfolio/600x600/81.jpg" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <a href="../assets/global/plugins/cubeportfolio/ajax/project1.html" class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase" rel="nofollow">more info</a>
                                                <a href="https://www.ted.com/talks/andrew_bastawrous_get_your_next_eye_exam_on_a_smartphone" class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase" data-title="Workout Buddy<br>by Tiberiu Neamu">view video</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center">Workout Buddy</div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center">Web Design / Graphic</div>
                            </div>
                            <div class="cbp-item identity web-design">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="../assets/global/img/portfolio/600x600/87.jpg" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <a href="../assets/global/plugins/cubeportfolio/ajax/project2.html" class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase" rel="nofollow">more info</a>
                                                <a href="https://www.youtube.com/watch?v=3wbvpOIIBQA" class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase" data-title="Bills Bills Bills<br>by Cosmin Capitanu">view video</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center">Bills Bills Bills</div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center">Identity / Web Design</div>
                            </div>
                            <div class="cbp-item identity logos">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="../assets/global/img/portfolio/600x600/102.jpg" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <a href="../assets/global/plugins/cubeportfolio/ajax/project1.html" class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase" rel="nofollow">more info</a>
                                                <a href="../assets/global/img/portfolio/1200x900/92.jpg" class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase" data-title="Generic Apps<br>by Cosmin Capitanu">view video</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center">Generic Apps</div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center">Identity / Logo</div>
                            </div>
                            <div class="cbp-item graphic web-design">
                                <div class="cbp-caption">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="../assets/global/img/portfolio/600x600/96.jpg" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignCenter">
                                            <div class="cbp-l-caption-body">
                                                <a href="../assets/global/plugins/cubeportfolio/ajax/project2.html" class="cbp-singlePage cbp-l-caption-buttonLeft btn red uppercase" rel="nofollow">more info</a>
                                                <a href="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/26519543&amp;auto_play=true&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"
                                                    class="cbp-lightbox cbp-l-caption-buttonRight btn red uppercase" data-title="Speed Detector<br>by Cosmin Capitanu">view sound</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cbp-l-grid-projects-title uppercase text-center">Speed Detector</div>
                                <div class="cbp-l-grid-projects-desc uppercase text-center">Graphic / Web Design</div>
                            </div>--%>

                        </div>
                
            <script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
            <script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
            <script src="../assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
            <script src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
            <script src="../assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
            <script src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
            <!-- END CORE PLUGINS -->
            <!-- BEGIN PAGE LEVEL PLUGINS -->
            <script src="../assets/global/plugins/cubeportfolio/js/jquery.cubeportfolio.min.js" type="text/javascript"></script>
            <!-- END PAGE LEVEL PLUGINS -->
            <!-- BEGIN THEME GLOBAL SCRIPTS -->
            <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
            <!-- END THEME GLOBAL SCRIPTS -->
            <!-- BEGIN PAGE LEVEL SCRIPTS -->
            <script src="../assets/pages/scripts/portfolio-1.min.js" type="text/javascript"></script>
            <!-- END PAGE LEVEL SCRIPTS -->
            <!-- BEGIN THEME LAYOUT SCRIPTS -->
            <script src="../assets/layouts/layout2/scripts/layout.min.js" type="text/javascript"></script>
            <script src="../assets/layouts/layout2/scripts/demo.min.js" type="text/javascript"></script>
            <script src="../assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
            <script src="../assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>

</asp:Content>

