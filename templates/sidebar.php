<div id="sidebar" class="col-lg-4">
    <!-- search box -->
    <div class="search-box-container">
        <h5>SEARCH</h5>
        <form class="search-post" action="http://pakcitizenss.epizy.com/search.php" method ="GET">
            <div class="input-group">
                <input type="text" name="search" class="form-control" placeholder="Search .....">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-outline-success">Search</button>
                </span>
            </div>
            <br><br>
        </form>
    </div>
    <!-- /search box -->


    <!-- recent posts box -->
    <div class="recent-post-container">
        <h5>RECENT POSTS</h5> <br>
        <?php
            $conn = new mysqli("sql300.epizy.com", "epiz_26632008","w9x8wQRg2IZW","epiz_26632008_Pakcitizen");
            $limit=4;   //limit the number of posts in recent

            $sql="SELECT * FROM post
            LEFT JOIN category ON post.postcategory=category.categoryID
            ORDER BY post.postID DESC LIMIT {$limit}";
            $result=$conn->query($sql);
            if($result->num_rows>0){
                while($row=$result->fetch_assoc()){
            ?>

            <!-- Recent Posts in SIde bar -->
        <div class="recent-post zoom" href="news.php?id=<?php echo $row["postID"]?>">
            <a class="post-img" href="http://pakcitizenss.epizy.com/News.php?id=<?php echo $row["postID"]?>">
                <img class="rounded" href="http://pakcitizenss.epizy.com/News.php?id=<?php echo $row["postID"]?>" src="Admin/Upload/<?php echo $row["postimage"]?>" alt=""/>
            </a><br>
            <div class="post-content">
                <br><h6><a href="http://pakcitizenss.epizy.com/News.php?id=<?php echo $row["postID"]?>">
                <?php echo $row['postTitle']; ?></a></h6>
                <small>
                <span>
                    <i class="fa fa-tags" aria-hidden="true"></i>
                    <a href="http://pakcitizenss.epizy.com/category.php?id=<?php echo $row['categoryID'];?>">
                    <?php echo $row['categoryName']." -  " ; ?></a>
                </span>
                <span>
                    <i class="fa fa-calendar" aria-hidden="true"></i>
                    <?php  echo  $row['postDate']; ?>
                </span>
                </small>
            </div>
            <br><br>
        </div>
        <?php  }}?>
    </div>
</div>
