#!/usr/bin/ruby
require 'selenium-webdriver'

class O20Vars

@@all_vars = {
    
    "HOMEPAGE" => "/",
    "OWNTV" => "/app/own-tv.html",
    "OMAG" => "/app/o-magazine.html",
    "VIDEOS" => "/app/video.html",
    "VIDEODETAILPAGE" => "/own-super-soul-sunday/Tina-Turner-and-Others-Define-God-Video",
    "BOOKS" => "/app/books.html",
    "QOUTABLES" => "/app/quotables.html",
    "INSPIRATION" => "/app/inspiration.html",
    "LIFECLASS" => "/app/oprahs-lifeclass.html",
    "SWEETIEPIES" => "/app/sweetie-pies.html",
    "SUPERSOULSUNDAY" => "/app/super-soul-sunday.html",
    "HEALTH" => "/app/health-and-wellness.html",
    "FOOD" => "/app/food.html",
    "HOMEGARDEN" => "/app/home-garden.html",
    "FASHION" => "/app/fashion-beauty.html",
    "HAVESANDHAVENOTS" => "/app/the-haves-and-the-have-nots.html",
    "IYANLA" => "/app/iyanla-fix-my-life.html",
    "LOVETHYNEIGHBOR" => "/app/love-thy-neighbor.html",
    "NEXTCHAPTER" => "/app/oprahs-next-chapter.html",
    "WHEREARETHEYNOW" => "/app/oprah-where-are-they-now.html",
    "RAISINGWHITLEY" => "/app/raising-whitley.html",
    "SIXLITTLEMCGHEES" => "/app/six-little-mcghees.html",
    "FORBETTERORWORSE" => "/app/for-better-or-worse.html",
    "LATOYA" => "/app/life-with-latoya.html",
    "HOMEMADESIMPLE" => "/app/home-made-simple.html",
    "LISALING" => "/app/our-america-with-lisa-ling.html",
    
    "expected_articles_2_0" => {
    "textArticle_standardText_withPagination" => { 1 => "/relationships/How-to-Comfort-Someone-What-to-Say-in-Difficult-Situations" },
    "textArticle_standardText_noPagination" => { 1 => "/spirit/Finding-Happiness-Blueprint-for-a-Happy-Year" },
    "textArticle_formattedLists" => { 1 => "/relationships/Dr-Laura-Bermans-Sex-Advice" },
    "textArticle_bulletedLists" => { 1 => "/relationships/Parenting-Advice-Raising-Kindergarteners-Preteens-Tweens-Teenagers" },
    "textArticle_recipe" => { 1 => "/food/Soba-Noodle-Bowl-Recipe" },
    "textArticle_embed" => { 1 => "/oprahs-lifeclass/Class-Notes-for-Oprahs-Lifeclass-Living-Bravely" },
    "printPage_standardText_withPagination" => { 1 => "/relationships/How-to-Comfort-Someone-What-to-Say-in-Difficult-Situations/print/1" },
    "printPage_standardText_slideshow" => { 1 => "/health/The-Healing-Powers-of-Cold-Temperatures-Therapeutic-Hypothermia/print/1/?slide=1" },
    "bioPage" => { 1 => "/own-love-thy-neighbor/Tyler-Perry_1 " },
    "listPage_verticalList" => { 1 => "/omagazine/O-You-Sponsors" },
    "listPage_horizontalList" => { 1 => "/own-oprah-behind-the-scenes/Meet-the-Staff-of-Harpo-Studios" },
    "aboutPage" => { 1 => "/own-oprah-behind-the-scenes/About-Season-25-Oprah-Behind-the-Scenes" },
    "videoDetail" => { 1 => "/own-oprah-behind-the-scenes/Inside-Oprahs-Finale-The-Truth-About-Sadie-Video" },
    "recipe" => { 1 => "/food/Beef-Skewers-with-Yakitori-Marinade-Recipe" },
    "sweepstakesDetail" => { 1 => "/home/Enter-to-Win-a-Platinum-Kitchen-Sweepstakes-for-New-Appliances/1" },
    "questionListPage_lifeclass" => { 1 => "/oprahs-lifeclass/Oprahs-Lifeclass-Social-Lab-Work-Dating-Smarter" },
    "questionListPage_iyanla" => { 1 => "/own-iyanla-fix-my-life/The-Work-Fix-My-Full-House" },
    "episodeDetail" => { 1 => "/own-iyanla-fix-my-life/Iyanla-Fix-My-Fatherless-Family" },
    "slideshows_350x363/300x363284x436/" => { 1 => "/entertainment/A-Look-Back-at-Elton-John",
    2 => "/food/Great-Grilling" },
    "slideshows_fashion" => { 1 => "/health/The-Healing-Powers-of-Cold-Temperatures-Therapeutic-Hypothermia" },
    "slideshows_ownshow" => { 1 => "/own-master-class/Maya-Angelous-Master-Class-Quotes" },
    "slideshows_story" => { 1 => "/food/Christmas-Cookie-Recipes-Cookie-Swap-Recipes" },
    "survey_quiz" => { 1 => "/relationships/What-Would-You-Tell-Your-Father--Oprahs-Lifeclass-Poll" },
    "workbook" => { 1 => "/spirit/Spirituality-Workbook_1" },
    "quoteDetail" => { 1 => "/quote/Antoine-de-Saint-Exupery-Quote-Life-Always-Bursts-the-Boundaries" },
    "quoteDetail_print" => { 1 => "/finder/quote/quote_details_print.html?article_id=39656&page=1&" },
    "quoteCollection" => { 1 => "/quote/Antoine-de-Saint-Exupery-Quote-Life-Always-Bursts-the-Boundaries" },
    },
    
    "not_expected_articles_2_0" => {
    "bookDetail" => { 1 => "/book/Lee-Krasner-A-Biography-by-Gail-Levin",
                      2 => "/book/Expecting-Adam-by-Martha-Beck" },
    "bookDetail_print" => { 1 => "/finder/book/book_details_print.html?article_id=29947&page=1&" },
    "bookList" => { 1 => "/book-list/18-Books-to-Watch-for-in-April-2011" },
    "bookList_print" => { 1 => "/finder/book/book_list_print.html?article_id=29973&" },
    "giftDetail_giftItem" => { 1 => "/gift/Bakers-Edge-Brownie-Pan?editors_pick_id=31148" },
    "giftDetail_printGift" => { 1 => "/finder/gift/gift_details_print.html?article_id=31214&page=1&" },
    "giftList" => { 1 => "/gift-list/Oprah-Show-Producers-Reveal-Their-All-Time-Favorite-Things_2" },
    "conversationPage" => { 1 => "/oprahdotcom/Oprahcom-Community-Conversations-Books" },
    "questionnairePage" => { 1 => "/questionaire/lifeyouwant.html?id=39" },
    },
}

    def getVar(key)
        
        return @@all_vars[key]
    end

    @@elements_by = {
    
    "scrollbar_btns" => {
    "xpath" => '//nav[contains(@class, "scroll-nav")]//div[contains(@class, "page_nav_btn")]'
    },
    
    "navapp_holders" => {
    "xpath" => '//div[contains(@class, "app-target ui-droppable")]'
    },
    
    "flyout_apps" => {
    "xpath" => '//div[contains(@class, "drag-app flyout static ui-draggable")]'
    },
    
    "flyout_featured_apps" => {
    "xpath" => '//div[contains(@class, "apps-category") and contains(., "FEATURED")]//div//div[contains(@class, "drag-app flyout static ui-draggable")]'
    },
    
    "flyout_interests_apps" => {
    "xpath" => '//div[contains(@class, "apps-category") and contains(., "INTERESTS")]//div//div[contains(@class, "drag-app flyout static ui-draggable")]'
    },
    
    "flyout_ownshows_apps" => {
    "xpath" => '//div[contains(@class, "apps-category") and contains(., "OWN SHOWS")]//div//div[contains(@class, "drag-app flyout static ui-draggable")]'
    },
    
    "grid_btn" => {
    "id" => 'browse-apps'
    },
    
    "search_btn" => {
    "xpath" => '//button[contains(@class, "icon-search")]'
    },
    
    "search_box" => {
    "id" => 'search-query'
    },
    
    "breadcrumb" => {
    "id" => 'breadcrumb'
    },
    
    "owntv_day_items" => {
    "xpath" => '//div[contains(@class, "day-view")]'
    },
    
    "owntv_slider" => {
    "xpath" => '//div[contains(@class, "button ui-draggable")]'
    },

    "owntv_daily_container" => {
    "xpath" => '//div[contains(@class, "sched-container")]'
    },
    
    "owntv_weekly_container" => {
    "xpath" => '//div[contains(@class, "grid-container grid")]'
    },
    
    "owntv_shows_items" => {
    "xpath" => '//div[contains(@class, "col-fifth")]'
    },
    
    "owntv_talkaboutit_items" => {
    "xpath" => '//div[contains(@class, "hub-content hub-item social_photo_deck_009 isotope-item")]'
    },
        
    "login_username" => {
    "name" => 'username'
    },
    
    "login_password" => {
    "name" => 'password'
    },
    
    "login_email" => {
    "name" => 'email'
    },
    
    "login_password_confirm" => {
    "name" => 'password_confirm'
    },
    
    "login_firstname" => {
    "name" => 'first_name'
    },
    
    "login_lastname" => {
    "name" => 'last_name'
    },
    
    "login_address1" => {
    "name" => 'address_1'
    },
    
    "login_address2" => {
    "name" => 'address_2'
    },
    
    "login_city" => {
    "name" => 'city'
    },
    
    "login_state" => {
    "name" => 'state'
    },
    
    "login_zip" => {
    "name" => 'zip_code'
    },
    
    "join_specialoffers_omag" => {
    "name" => 'free_mag'
    },
    
    "join_specialoffers_owners" => {
    "name" => 'owners'
    },
    
    "login_btn" => {
    "xpath" => '//button[contains(., "Sign In")]'
    },
    
    "join_btn" => {
    "xpath" => '//button[contains(., "Join")]'
    },
    
    "join_link" => {
    "xpath" => '//a[contains(@class, "register-link")]'
    },
    
    "visit_your_profile_btn" => {
    "xpath" => '//a[contains(., "Visit Your Profile")]'
    },
    
    "menu_sign_in_btn" => {
    "xpath" => '//div[contains(@class, "login")]'
    },
    
    "menu_signed_in_btn" => {
    "xpath" => '//div[contains(@class, "profile")]'
    },
    
    "sign_out_btn" => {
    "xpath" => '//button[contains(@class, "signout-btn")]'
    },
   
    "video_title_desc" => {
    "id" => 'video_title'	    
    },

    "video_subtitle_desc" => {
    "id" => 'video_subtitle'
    },

    "carousal_img" => {
    "xpath" => '//div[contains(@class, "cards")]' 	    
    },	    

   "share_bar_icon" => {
    "id" => 'social_bar'
    },

   "video_comment" => {
     "xpath" => '//div[contains(@class, "comment_form_container")]'
    },	    

   "carousal_left_click" => {
    "xpath" => '//div[contains(@class, "arrow arrow-left")]'	    
    },

   "carousal_right_click" => {
    "xpath" => '//div[contains(@class, "arrow arrow-right")]'	    
    },	

   "quotable_info_icon" => {
    "xpath" => '//div[contains(@class, "icon icon-info action-right action-toggle-flip")]'	    
    },

    }

def getElementBy(elem_name)
    
    return  @@elements_by[elem_name]
end
    
end
