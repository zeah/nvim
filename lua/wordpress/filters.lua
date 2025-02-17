local M = {}

function M:enabled()
  if vim.bo.filetype ~= "php" then
    return false
  end
  return true
end

function M:get_trigger_characters()
  return { "'" }
end

function M:get_completions(context, callback)
  if not vim.api.nvim_get_current_line():match("add_filter%(") then
    return callback({ items = {} })
  end
  return callback({
    items = {
      {
        label = "attachment_fields_to_edit",
        documentation = "applied to the form fields to be displayed when editing an attachment. Called in the  get_attachment_fields_to_edit  function. Filter function arguments: an array of form fields, the post object.",
      },
      {
        label = "attachment_icon",
        documentation = "applied to the icon for an attachment in the  get_attachment_icon  function. Filter function arguments: icon file as an HTML IMG tag, attachment ID.",
      },
      {
        label = "attachment_innerHTML",
        documentation = "applied to the title to be used for an attachment if there is no icon, in the  get_attachment_innerHTML  function. Filter function arguments: inner HTML (defaults to the title), attachment ID.",
      },
      { label = "author_edit_pre", documentation = "applied to post author prior to display for editing." },
      { label = "body_class", documentation = "applied to the classes for the HTML" },
      { label = "content_edit_pre", documentation = "applied to post content prior to display for editing." },
      {
        label = "content_filtered_edit_pre",
        documentation = "applied to post content filtered prior to display for editing.",
      },
      { label = "excerpt_edit_pre", documentation = "applied to post excerpt prior to display for editing." },
      { label = "date_edit_pre", documentation = "applied to post date prior to display for editing." },
      { label = "date_gmt_edit_pre", documentation = "applied to post date prior to display for editing." },
      {
        label = "get_attached_file",
        documentation = "applied to the attached file information retrieved by the  get_attached_file  function. Filter function arguments: file information, attachment ID.",
      },
      {
        label = "get_enclosed",
        documentation = "applied to the enclosures list for a post by the  get_enclosed  function.",
      },
      {
        label = "get_pages",
        documentation = "applied to the list of pages returned by the  get_pages  function . Filter function arguments: list of pages (each item of which contains a page data array),  get_pages  function argument list (telling which pages were requested).",
      },
      {
        label = "get_pung",
        documentation = "applied to the list of pinged URLs for a post by the  get_pung  function.",
      },
      {
        label = "get_the_archive_title",
        documentation = "applied to the archive’s title in the  get_the_archive_title  function.",
      },
      {
        label = "get_the_excerpt",
        documentation = "applied to the post’s excerpt in the  get_the_excerpt  function.",
      },
      { label = "get_the_guid", documentation = "applied to the post’s GUID in the  get_the_guid  function." },
      {
        label = "get_to_ping",
        documentation = "applied to the list of URLs to ping for a post by the  get_to_ping  function.",
      },
      {
        label = "icon_dir",
        documentation = "applied to the template’s image directory in several functions. Basically allows a plugin to specify that icons for MIME types should come from a different location.",
      },
      {
        label = "icon_dir_uri",
        documentation = "applied to the template’s image directory URI in several functions. Basically allows a plugin to specify that icons for MIME types should come from a different location.",
      },
      {
        label = "image_size_names_choose",
        documentation = "applied to the list of image sizes selectable in the Media Library. Commonly used to make  custom image sizes  selectable.",
      },
      { label = "mime_type_edit_pre", documentation = "applied to post mime type prior to display for editing." },
      {
        label = "modified_edit_pre",
        documentation = "applied to post modification date prior to display for editing.",
      },
      {
        label = "modified_gmt_edit_pre",
        documentation = "applied to post modification gmt date prior to display for editing.",
      },
      {
        label = "no_texturize_shortcodes",
        documentation = "applied to registered shortcodes. Can be used to exempt shortcodes from the automatic texturize function.",
      },
      { label = "parent_edit_pre", documentation = "applied to post parent id prior to display for editing." },
      { label = "password_edit_pre", documentation = "applied to post password prior to display for editing." },
      {
        label = "post_class",
        documentation = "applied to the classes of the outermost HTML element for a post. Called in the  get_post_class  function. Filter function arguments: an array of class names, an array of additional class names that were added to the first array, and the post ID.",
      },
      {
        label = "pre_kses",
        documentation = "applied to various content prior to being processed/sanitized by KSES. This hook allows developers to customize what types of scripts/tags should either be allowed in content or stripped.",
      },
      {
        label = "prepend_attachment",
        documentation = "applied to the HTML to be prepended by the  prepend_attachment  function.",
      },
      {
        label = "protected_title_format",
        documentation = "Used to the change or manipulate the post title when the post is password protected.",
      },
      {
        label = "private_title_format",
        documentation = "Used to the change or manipulate the post title when its status is private. sanitize_title  : applied to a post title by the  sanitize_title  function, after stripping out HTML tags.",
      },
      {
        label = "single_post_title",
        documentation = "applied to the post title when used to create a blog page title by the  wp_title  and  single_post_title  functions.",
      },
      { label = "status_edit_pre", documentation = "applied to post status prior to display for editing." },
      {
        label = "the_content",
        documentation = "applied to the post content retrieved from the database, prior to printing on the screen (also used in some other operations, such as trackbacks).",
      },
      { label = "the_content_feed", documentation = "applied to the post content prior to including in an RSS feed." },
      {
        label = "the_editor_content",
        documentation = "applied to post content before putting it into a rich editor window.",
      },
      {
        label = "the_excerpt",
        documentation = "applied to the post excerpt (or post content, if there is no excerpt) retrieved from the database, prior to printing on the screen (also used in some other operations, such as trackbacks).",
      },
      { label = "the_excerpt_rss", documentation = "applied to the post excerpt prior to including in an RSS feed." },
      { label = "the_password_form", documentation = "applied to the password form for protected posts." },
      {
        label = "the_tags",
        documentation = "applied to the tags retrieved from the database, prior to printing on the screen.",
      },
      {
        label = "the_title",
        documentation = "applied to the post title retrieved from the database, prior to printing on the screen (also used in some other operations, such as trackbacks).",
      },
      {
        label = "the_title_rss",
        documentation = "applied to the post title before including in an RSS feed (after first filtering with  the_title .",
      },
      { label = "title_edit_pre", documentation = "applied to post title prior to display for editing." },
      { label = "type_edit_pre", documentation = "applied to post type prior to display for editing." },
      {
        label = "wp_dropdown_pages",
        documentation = "applied to the HTML dropdown list of WordPress pages generated by the  wp_dropdown_pages  function.",
      },
      {
        label = "wp_list_pages",
        documentation = "applied to the HTML list generated by the  wp_list_pages  function.",
      },
      {
        label = "wp_list_pages_excludes",
        documentation = "applied to the list of excluded pages (an array of page IDs) in the  wp_list_pages  function.",
      },
      {
        label = "wp_get_attachment_metadata",
        documentation = "applied to the attachment metadata retrieved by the  wp_get_attachment_metadata  function. Filter function arguments: meta data, attachment ID.",
      },
      {
        label = "wp_get_attachment_thumb_file",
        documentation = "applied to the attachment thumbnail file retrieved by the  wp_get_attachment_thumb_file  function. Filter function arguments: thumbnail file, attachment ID.",
      },
      {
        label = "wp_get_attachment_thumb_url",
        documentation = "applied to the attachment thumbnail URL retrieved by the  wp_get_attachment_thumb_URL  function. Filter function arguments: thumbnail URL, attachment ID.",
      },
      {
        label = "wp_get_attachment_url",
        documentation = "applied to the attachment URL retrieved by the  wp_get_attachment_url  function. Filter function arguments: URL, attachment ID.",
      },
      {
        label = "wp_mime_type_icon",
        documentation = "applied to the MIME type icon for an attachment calculated by the  wp_mime_type_icon  function. Filter function arguments: icon URI calculated, MIME type, post ID.",
      },
      {
        label = "wp_title",
        documentation = "applied to the blog page title before sending to the browser in the  wp_title  function.",
      },
      {
        label = "add_ping",
        documentation = "applied to the new value of the pinged field on a post when a ping is added, prior to saving the new information in the database.",
      },
      {
        label = "attachment_fields_to_save",
        documentation = "applied to fields associated with an attachment prior to saving them in the database. Called in the  media_upload_form_handler  function. Filter function arguments: an array of post attributes, an array of attachment fields including the changes submitted from the form.",
      },
      {
        label = "attachment_max_dims",
        documentation = "applied to the maximum image dimensions before reducing an image size. Filter function input (and return value) is either false (if no maximum dimensions have been specified) or a two-item list (width, height).",
      },
      {
        label = "category_save_pre",
        documentation = "applied to post category comma-separated list prior to saving it in the database (also used for attachments).",
      },
      {
        label = "comment_status_pre",
        documentation = "applied to post comment status prior to saving it in the database (also used for attachments).",
      },
      {
        label = "content_filtered_save_pre",
        documentation = "applied to filtered post content prior to saving it in the database (also used for attachments).",
      },
      {
        label = "content_save_pre",
        documentation = "applied to post content prior to saving it in the database (also used for attachments).",
      },
      {
        label = "excerpt_save_pre",
        documentation = "applied to post excerpt prior to saving it in the database (also used for attachments).",
      },
      {
        label = "phone_content",
        documentation = "applied to the content of a post submitted by email, before saving.",
      },
      {
        label = "ping_status_pre",
        documentation = "applied to post ping status prior to saving it in the database (also used for attachments).",
      },
      {
        label = "post_mime_type_pre",
        documentation = "applied to the MIME type for an attachment prior to saving it in the database.",
      },
      { label = "status_save_pre", documentation = "applied to post status prior to saving it in the database." },
      {
        label = "thumbnail_filename",
        documentation = "applied to the file name for the thumbnail when uploading an image.",
      },
      {
        label = "title_save_pre",
        documentation = "applied to post title prior to saving it in the database (also used for attachments).",
      },
      {
        label = "update_attached_file",
        documentation = "applied to the attachment information prior to saving in post metadata in the  update_attached_file  function. Filter function arguments: attachment information, attachment ID.",
      },
      { label = "wp_delete_file", documentation = "applied to an attachment file name just before deleting." },
      {
        label = "wp_generate_attachment_metadata",
        documentation = "applied to the attachment metadata array before saving in the database.",
      },
      {
        label = "wp_thumbnail_creation_size_limit",
        documentation = "applied to the size of the thumbnail when uploading an image. Filter function arguments: max file size, attachment ID, attachment file name.",
      },
      {
        label = "wp_thumbnail_max_side_length",
        documentation = "applied to the size of the thumbnail when uploading an image. Filter function arguments: image side max size, attachment ID, attachment file name.",
      },
      {
        label = "wp_update_attachment_metadata",
        documentation = "applied to the attachment metadata just before saving in the  wp_update_attachment_metadata  function. Filter function arguments: meta data, attachment ID.",
      },
      {
        label = "comment_excerpt",
        documentation = "applied to the comment excerpt by the  comment_excerpt  function. See also  get_comment_excerpt .",
      },
      {
        label = "comment_flood_filter",
        documentation = "applied when someone appears to be flooding your blog with comments. Filter function arguments: already blocked (true/false, whether a previous filtering plugin has already blocked it; set to true and return true to block this comment in a plugin), time of previous comment, time of current comment.",
      },
      {
        label = "comment_post_redirect",
        documentation = "applied to the redirect location after someone adds a comment. Filter function arguments: redirect location, comment info array.",
      },
      {
        label = "comment_text",
        documentation = "applied to the comment text before displaying on the screen by the  comment_text  function, and in the admin menus.",
      },
      { label = "comment_text_rss", documentation = "applied to the comment text prior to including in an RSS feed." },
      {
        label = "comments_array",
        documentation = "applied to the array of comments for a post in the  comments_template  function. Filter function arguments: array of comment information structures, post ID.",
      },
      {
        label = "comments_number",
        documentation = "applied to the formatted text giving the number of comments generated by the  comments_number  function. See also  get_comments_number .",
      },
      {
        label = "get_comment_excerpt",
        documentation = "applied to the comment excerpt read from the database by the  get_comment_excerpt  function (which is also called by  comment_excerpt . See also  comment_excerpt .",
      },
      {
        label = "get_comment_ID",
        documentation = "applied to the comment ID read from the global  $comments  variable by the  get_comment_ID  function.",
      },
      {
        label = "get_comment_text",
        documentation = "applied to the comment text of the current comment in the  get_comment_text  function, which is also called by the  comment_text  function.",
      },
      {
        label = "get_comment_type",
        documentation = "applied to the comment type (“comment”, “trackback”, or “pingback”) by the  get_comment_type  function (which is also called by  comment_type ).",
      },
      {
        label = "get_comments_number",
        documentation = "applied to the comment count read from the  $post  global variable by the  get_comments_number  function (which is also called by the  comments_number  function; see also  comments_number  filter).",
      },
      {
        label = "post_comments_feed_link",
        documentation = "applied to the feed URL generated for the comments feed by the  comments_rss  function.",
      },
      {
        label = "comment_save_pre",
        documentation = "applied to the comment data just prior to updating/editing comment data. Function arguments: comment data array, with indices “comment_post_ID”, “comment_author”, “comment_author_email”, “comment_author_url”, “comment_content”, “comment_type”, and “user_ID”.",
      },
      {
        label = "pre_comment_approved",
        documentation = "applied to the current comment’s approval status (true/false) to allow a plugin to override. Return true/false and set first argument to true/false to approve/disapprove the comment, and use global variables such as  $comment_ID  to access information about this comment.",
      },
      {
        label = "pre_comment_content",
        documentation = "applied to the content of a comment prior to saving the comment in the database.",
      },
      {
        label = "preprocess_comment",
        documentation = "applied to the comment data prior to any other processing, when saving a new comment in the database. Function arguments: comment data array, with indices “comment_post_ID”, “comment_author”, “comment_author_email”, “comment_author_url”, “comment_content”, “comment_type”, and “user_ID”.",
      },
      {
        label = "wp_insert_post_data",
        documentation = "applied to modified and unmodified post data in  wp_insert_post()   prior to update or insertion of post into database. Function arguments: modified and extended post array and sanitized post array.",
      },
      {
        label = "category_description",
        documentation = "applied to the “description” field categories by the  category_description  and  wp_list_categories  functions. Filter function arguments: description, category ID when called from  category_description ; description, category information array (all fields from the category table for that particular category) when called from  wp_list_categories .",
      },
      {
        label = "category_feed_link",
        documentation = "applied to the feed URL generated for the category feed by the  get_category_feed_link  function.",
      },
      {
        label = "category_link",
        documentation = "applied to the URL created for a category by the  get_category_link  function. Filter function arguments: link URL, category ID.",
      },
      {
        label = "get_ancestors",
        documentation = "applied to the list of ancestor IDs returned by the  get_ancestors  function (which is in turn used by many other functions). Filter function arguments: ancestor IDs array, given object ID, given object type.",
      },
      {
        label = "get_categories",
        documentation = "applied to the category list generated by the  get_categories  function (which is in turn used by many other functions). Filter function arguments: category list,  get_categories  options list.",
      },
      {
        label = "get_category",
        documentation = "applied to the category information that the  get_category  function looks up, which is basically an array of all the fields in WordPress’s category table for a particular category ID.",
      },
      { label = "list_cats", documentation = "called for two different purposes:" },
      {
        label = "list_cats_exclusions",
        documentation = "applied to the SQL WHERE statement giving the categories to be excluded by the  get_categories  function. Typically, a plugin would add to this list, in order to exclude certain categories or groups of categories from category lists. Filter function arguments: excluded category WHERE clause,  get_categories  options list.",
      },
      {
        label = "single_cat_title",
        documentation = "applied to the category name when used to create a blog page title by the  wp_title  and  single_cat_title  functions.",
      },
      {
        label = "the_category",
        documentation = "applied to the list of categories (an HTML list with links) created by the  get_the_category_list  function. Filter function arguments: generated HTML text, list separator being used (empty string means it is a default LI list),  parents  argument to  get_the_category_list .",
      },
      {
        label = "the_category_rss",
        documentation = "applied to the category list (a list of category XML elements) for a post by the  get_the_category_rss  function, before including in an RSS feed. Filter function arguments are the list text and the type (“rdf” or “rss” generally).",
      },
      {
        label = "wp_dropdown_cats",
        documentation = "applied to the drop-down category list (a text string containing HTML option elements) generated by the  wp_dropdown_categories  function.",
      },
      {
        label = "wp_list_categories",
        documentation = "applied to the category list (an HTML list) generated by the  wp_list_categories  function.",
      },
      {
        label = "wp_get_object_terms",
        documentation = "applied to the list of terms (an array of objects) generated by the  wp_get_object_terms  function, which is called by a number of category/term related functions, such as  get_the_terms  and  get_the_category .",
      },
      {
        label = "pre_category_description",
        documentation = "applied to the category desription prior to saving in the database.",
      },
      {
        label = "wp_update_term_parent",
        documentation = "filter term parent before update to term is applied, hook to this filter to see if it will cause a hierarchy loop.",
      },
      {
        label = "edit_terms",
        documentation = "(actually an action, but often used like a filter) hooked in prior to saving taxonomy/category change in the database",
      },
      { label = "pre_category_name", documentation = "applied to the category name prior to saving in the database." },
      {
        label = "pre_category_nicename",
        documentation = "applied to the category nice name prior to saving in the database.",
      },
      {
        label = "attachment_link",
        documentation = "applied to the calculated attachment permalink by the  get_attachment_link  function. Filter function arguments: link URL, attachment ID.",
      },
      {
        label = "author_feed_link",
        documentation = "applied to the feed URL generated for the author feed by the  get_author_rss_link  function.",
      },
      {
        label = "author_link",
        documentation = "applied to the author’s archive permalink created by the  get_author_posts_url  function. Filter function arguments: link URL, author ID, author’s “nice” name. Note that  get_author_posts_url  is called within functions  wp_list_authors  and  the_author_posts_link .",
      },
      {
        label = "comment_reply_link",
        documentation = "applied to the link generated for replying to a specific comment by the  get_comment_reply_link  function which is called within function  comments_template . Filter function arguments: link (string), custom options (array), current comment (object), current post (object).",
      },
      {
        label = "day_link",
        documentation = "applied to the link URL for a daily archive by the  get_day_link  function. Filter function arguments: URL, year, month number, day number.",
      },
      {
        label = "feed_link",
        documentation = "applied to the link URL for a feed by the  get_feed_link  function. Filter function arguments: URL, type of feed (e.g. “rss2”, “atom”, etc.).",
      },
      {
        label = "get_comment_author_link",
        documentation = "applied to the HTML generated for the author’s link on a comment, in the  get_comment_author_link  function (which is also called by  comment_author_link . Action function arguments: user name",
      },
      {
        label = "get_comment_author_url_link",
        documentation = "applied to the HTML generated for the author’s link on a comment, in the  get_comment_author_url_link  function (which is also called by  comment_author_link ).",
      },
      {
        label = "month_link",
        documentation = "applied to the link URL for a monthly archive by the  get_month_link  function. Filter function arguments: URL, year, month number.",
      },
      {
        label = "page_link",
        documentation = "applied to the calculated page URL by the  get_page_link  function. Filter function arguments: URL, page ID. Note that there is also an internal filter called  _get_page_link  that can be used to filter the URLS of pages that are not designated as the blog’s home page (same arguments). Note that this only applies to WordPress pages, not posts, custom post types, or attachments.",
      },
      {
        label = "post_link",
        documentation = "applied to the calculated post permalink by the  get_permalink  function, which is also called by the  the_permalink ,  post_permalink ,  previous_post_link , and  next_post_link  functions. Filter function arguments: permalink URL, post data list. Note that this only applies to WordPress default posts, and not custom post types (nor pages or attachments).",
      },
      {
        label = "post_type_link",
        documentation = "applied to the calculated custom post type permalink by the  get_post_permalink  function.",
      },
      {
        label = "the_permalink",
        documentation = "applied to the permalink URL for a post prior to printing by function  the_permalink .",
      },
      {
        label = "year_link",
        documentation = "applied to the link URL for a yearly archive by the  get_year_link  function. Filter function arguments: URL, year.",
      },
      {
        label = "tag_link",
        documentation = "applied to the URL created for a tag by the get_tag_link function. Filter function arguments: link URL, tag ID.",
      },
      {
        label = "term_link",
        documentation = "applied to the URL created for a term by the get_term_link function. Filter function arguments: term link URL, term object and taxonomy slug.",
      },
      {
        label = "get_comment_date",
        documentation = "applied to the formatted comment date generated by the  get_comment_date  function (which is also called by  comment_date ).",
      },
      {
        label = "get_comment_time",
        documentation = "applied to the formatted comment time in the  get_comment_time  function (which is also called by  comment_time ).",
      },
      {
        label = "get_the_modified_date",
        documentation = "applied to the formatted post modification date generated by the  get_the_modified_date  function (which is also called by the  the_modified_date  function).",
      },
      {
        label = "get_the_modified_time",
        documentation = "applied to the formatted post modification time generated by the  get_the_modified_time  and  get_post_modified_time  functions (which are also called by the  the_modified_time  function).",
      },
      {
        label = "get_the_time",
        documentation = "applied to the formatted post time generated by the  get_the_time  and  get_post_time  functions (which are also called by the  the_time  function).",
      },
      {
        label = "the_date",
        documentation = "applied to the formatted post date generated by the  the_date  function.",
      },
      {
        label = "the_modified_date",
        documentation = "applied to the formatted post modification date generated by the  the_modified_date  function.",
      },
      {
        label = "the_modified_time",
        documentation = "applied to the formatted post modification time generated by the  the_modified_time  function.",
      },
      {
        label = "the_time",
        documentation = "applied to the formatted post time generated by the  the_time  function.",
      },
      {
        label = "the_weekday",
        documentation = "applied to the post date weekday name generated by the  the_weekday  function.",
      },
      {
        label = "the_weekday_date",
        documentation = "applied to the post date weekday name generated by the  the_weekday_date  function. Function arguments are the weekday name, before text, and after text (before text and after text are added to the weekday name if the current post’s weekday is different from the previous post’s weekday).",
      },
      {
        label = "login_body_class",
        documentation = "Allows filtering of the body class applied to the login screen in  login_header() .",
      },
      {
        label = "login_redirect",
        documentation = "applied to the  redirect_to  post/get variable during the user login process.",
      },
      {
        label = "user_contactmethods",
        documentation = "applied to the contact methods fields on the user profile page. (old page is here:  contactmethods )",
      },
      { label = "update_(meta_type)_metadata", documentation = "applied before a (user) metadata gets updated." },
      {
        label = "author_email",
        documentation = "applied to the comment author’s email address retrieved from the database by the  comment_author_email  function. See also  get_comment_author_email .",
      },
      {
        label = "comment_author",
        documentation = "applied to the comment author’s name retrieved from the database by the  comment_author  function. See also  get_comment_author . comment_author_rss  : applied to the comment author’s name prior to including in an RSS feed.",
      },
      {
        label = "comment_email",
        documentation = "applied to the comment author’s email address retrieved from the database by the  comment_author_email_link  function.",
      },
      {
        label = "comment_url",
        documentation = "applied to the comment author’s URL retrieved from the database by the  comment_author_url  function (see also  get_comment_author_url ).",
      },
      {
        label = "get_comment_author",
        documentation = "applied to the comment author’s name retrieved from the database by  get_comment_author , which is also called by  comment_author . See also  comment_author .",
      },
      {
        label = "get_comment_author_email",
        documentation = "applied to the comment author’s email address retrieved from the database by  get_comment_author_email , which is also called by  comment_author_email . See also  author_email .",
      },
      {
        label = "get_comment_author_IP",
        documentation = "applied to the comment author’s IP address retrieved from the database by the  get_comment_author_IP  function, which is also called by  comment_author_IP .",
      },
      {
        label = "get_comment_author_url",
        documentation = "applied to the comment author’s URL retrieved from the database by the  get_comment_author_url  function, which is also called by  comment_author_url . See also  comment_url .",
      },
      { label = "login_errors", documentation = "applied to the login error message printed on the login screen." },
      {
        label = "login_headertitle",
        documentation = "applied to the title for the login header URL (Powered by WordPress by default) printed on the login screen.",
      },
      {
        label = "login_headerurl",
        documentation = "applied to the login header URL (points to wordpress.org by default) printed on the login screen.",
      },
      { label = "login_message", documentation = "applied to the login message printed on the login screen." },
      {
        label = "role_has_cap",
        documentation = "applied to a role’s capabilities list in the  WP_Role->has_cap  function. Filter function arguments are the capabilities list to be filtered, the capability being questioned, and the role’s name.",
      },
      {
        label = "sanitize_user",
        documentation = "applied to a user name by the  sanitize_user  function. Filter function arguments: user name (after some cleaning up), raw user name, strict (true or false to use strict ASCII or not).",
      },
      {
        label = "the_author",
        documentation = "applied to a post author’s displayed name by the  get_the_author  function, which is also called by the  the_author  function.",
      },
      {
        label = "the_author_email",
        documentation = "applied to a post author’s email address by the  the_author_email  function.",
      },
      {
        label = "user_search_columns",
        documentation = "applied to the list of columns in the wp_users table to include in the  WHERE  clause inside  WP_User_Query .",
      },
      {
        label = "pre_comment_author_email",
        documentation = "applied to a comment author’s email address prior to saving the comment in the database.",
      },
      {
        label = "pre_comment_author_name",
        documentation = "applied to a comment author’s user name prior to saving the comment in the database.",
      },
      {
        label = "pre_comment_author_url",
        documentation = "applied to a comment author’s URL prior to saving the comment in the database.",
      },
      {
        label = "pre_comment_user_agent",
        documentation = "applied to the comment author’s user agent prior to saving the comment in the database.",
      },
      {
        label = "pre_comment_user_ip",
        documentation = "applied to the comment author’s IP address prior to saving the comment in the database.",
      },
      {
        label = "pre_user_id",
        documentation = "applied to the comment author’s user ID prior to saving the comment in the database.",
      },
      {
        label = "pre_user_description",
        documentation = "applied to the user’s description prior to saving in the database.",
      },
      {
        label = "pre_user_display_name",
        documentation = "applied to the user’s displayed name prior to saving in the database.",
      },
      {
        label = "pre_user_email",
        documentation = "applied to the user’s email address prior to saving in the database.",
      },
      {
        label = "pre_user_first_name",
        documentation = "applied to the user’s first name prior to saving in the database.",
      },
      {
        label = "pre_user_last_name",
        documentation = "applied to the user’s last name prior to saving in the database.",
      },
      {
        label = "pre_user_login",
        documentation = "applied to the user’s login name prior to saving in the database.",
      },
      {
        label = "pre_user_nicename",
        documentation = "applied to the user’s “nice name” prior to saving in the database.",
      },
      {
        label = "pre_user_nickname",
        documentation = "applied to the user’s nickname prior to saving in the database.",
      },
      { label = "pre_user_url", documentation = "applied to the user’s URL prior to saving in the database." },
      {
        label = "registration_errors",
        documentation = "applied to the list of registration errors generated while registering a user for a new account.",
      },
      {
        label = "user_registration_email",
        documentation = "applied to the user’s email address read from the registration page, prior to trying to register the person as a new user.",
      },
      {
        label = "validate_username",
        documentation = "applied to the validation result on a new user name. Filter function arguments: valid (true/false), user name being validated.",
      },
      {
        label = "get_bookmarks",
        documentation = "applied to link/blogroll database query results by the  get_bookmarks  function. Filter function arguments: database query results list,  get_bookmarks  arguments list.",
      },
      {
        label = "link_category",
        documentation = "applied to the link category by the  get_links_list  and  wp_list_bookmarks  functions (as of WordPress 2.2).",
      },
      {
        label = "link_description",
        documentation = "applied to the link description by the  get_links  and  wp_list_bookmarks  functions (as of WordPress 2.2).",
      },
      { label = "link_rating", documentation = "applied to the link rating number by the  get_linkrating  function." },
      {
        label = "link_title",
        documentation = "applied to the link title by the  get_links  and  wp_list_bookmarks  functions (as of WordPress 2.2)",
      },
      {
        label = "pre_link_description",
        documentation = "applied to the link description prior to saving in the database.",
      },
      { label = "pre_link_image", documentation = "applied to the link image prior to saving in the database." },
      { label = "pre_link_name", documentation = "applied to the link name prior to saving in the database." },
      { label = "pre_link_notes", documentation = "applied to the link notes prior to saving in the database." },
      {
        label = "pre_link_rel",
        documentation = "applied to the link relation information prior to saving in the database.",
      },
      { label = "pre_link_rss", documentation = "applied to the link RSS URL prior to saving in the database." },
      {
        label = "pre_link_target",
        documentation = "applied to the link target information prior to saving in the database.",
      },
      { label = "pre_link_url", documentation = "applied to the link URL prior to saving in the database." },
      {
        label = "all_options",
        documentation = "applied to the option list retrieved from the database by the  get_alloptions  function.",
      },
      {
        label = "all_plugins",
        documentation = "applied to the list of plugins retrieved for display in the plugins list table.",
      },
      {
        label = "bloginfo",
        documentation = "applied to the blog option information retrieved from the database by the  bloginfo  function, after first retrieving the information with the  get_bloginfo  function. A second argument  $show  gives the name of the bloginfo option that was requested. Note that  bloginfo('url') ,  bloginfo('directory')  and  bloginfo('home')  do  not  use this filtering function (see  bloginfo_url ).",
      },
      {
        label = "bloginfo_rss",
        documentation = "applied to the blog option information by function  get_bloginfo_rss  (which is also called from  bloginfo_rss ), after first retrieving the information with the  get_bloginfo  function, stripping out HTML tags, and converting characters appropriately. A second argument  $show  gives the name of the bloginfo option that was requested.",
      },
      {
        label = "bloginfo_url",
        documentation = "applied to the the output of  bloginfo('url') ,  bloginfo('directory')  and  bloginfo('home')  before returning the information.",
      },
      {
        label = "loginout",
        documentation = "applied to the HTML link for logging in and out (generally placed in the sidebar) generated by the  wp_loginout  function.",
      },
      { label = "lostpassword_url", documentation = "applied to the URL that allows users to reset their passwords." },
      {
        label = "option_(option name)",
        documentation = "applied to the option value retrieved from the database by the  get_option  function, after unserializing (which decodes array-based options). To use this filter, you will need to add filters for specific options names, such as “option_foo” to filter the output of  get_option('foo') .",
      },
      {
        label = "pre_get_space_used",
        documentation = "applied to the  get_space_used()  function to provide an alternative way of displaying storage space used. Returning false from this filter will revert to default display behavior (used  wp_upload_dir()   directory space in megabytes).",
      },
      {
        label = "pre_option_(option name)",
        documentation = "applied to the option value retrieved from the database by the  get_alloptions  function, after unserializing (which decodes array-based options). To use this filter, you will need to add filters for specific options names, such as “pre_option_foo” to filter the option “foo”.",
      },
      {
        label = "pre_update_option_(option name)",
        documentation = "applied the option value before being saving to the database to allow overriding the value to be stored. To use this filter, you will need to add filters for specific options names, such as “pre_update_option_foo” to filter the option “foo”.",
      },
      {
        label = "register",
        documentation = "applied to the sidebar link created for the user to register (if allowed) or visit the admin panels (if already logged in) by the  wp_register  function.",
      },
      {
        label = "upload_dir",
        documentation = "applied to the directory to be used for uploads calculated by the  wp_upload_dir  function. Filter function argument is an array with components “dir” (the upload directory path), “url” (the URL of the upload directory), and “error” (which you can set to true if you want to generate an error).",
      },
      {
        label = "upload_mimes",
        documentation = "allows a filter function to return a list of MIME types for uploads, if there is no MIME list input to the  wp_check_filetype  function. Filter function argument is an associated list of MIME types whose component names are file extensions (separated by vertical bars) and values are the corresponding MIME types.",
      },
      {
        label = "attribute_escape",
        documentation = "applied to post text and other content by the  attribute_escape  function, which is called in many places in WordPress to change certain characters into HTML attributes before sending to the browser.",
      },
      {
        label = "js_escape",
        documentation = "applied to JavaScript code before sending to the browser in the  js_escape  function.",
      },
      {
        label = "sanitize_key",
        documentation = "applied to key before using it for your settings, field, or other needs, generated by  sanitize_key  function",
      },
      {
        label = "admin_user_info_links",
        documentation = "applied to the user profile and info links in the WordPress admin quick menu.",
      },
      { label = "autosave_interval", documentation = "applied to the interval for auto-saving posts." },
      { label = "bulk_actions", documentation = "applied to an array of bulk items in admin bulk action dropdowns." },
      { label = "bulk_post_updated_messages", documentation = "applied to an array of bulk action updated messages." },
      {
        label = "cat_rows",
        documentation = "applied to the category rows HTML generated for managing categories in the admin menus.",
      },
      {
        label = "comment_edit_pre",
        documentation = "applied to comment content prior to display in the editing screen.",
      },
      {
        label = "comment_edit_redirect",
        documentation = "applied to the redirect location after someone edits a comment in the admin menus. Filter function arguments: redirect location, comment ID.",
      },
      {
        label = "comment_moderation_subject",
        documentation = "applied to the mail subject before sending email notifying the administrator of the need to moderate a new comment. Filter function arguments: mail subject, comment ID..",
      },
      {
        label = "comment_moderation_text",
        documentation = "applied to the body of the mail message before sending email notifying the administrator of the need to moderate a new comment. Filter function arguments: mail body text, comment ID.",
      },
      {
        label = "comment_notification_headers",
        documentation = "applied to the mail headers before sending email notifying the post author of a new comment. Filter function arguments: mail header text, comment ID.",
      },
      {
        label = "comment_notification_subject",
        documentation = "applied to the mail subject before sending email notifying the post author of a new comment. Filter function arguments: mail subject, comment ID.",
      },
      {
        label = "comment_notification_text",
        documentation = "applied to the body of the mail message before sending email notifying the post author of a new comment. Filter function arguments: mail body text, comment ID.",
      },
      {
        label = "comment_row_actions",
        documentation = "applied to the list of action links under each comment row (like Reply, Quick Edit, Edit).",
      },
      {
        label = "cron_request",
        documentation = "Allows filtering of the URL, key and arguments passed to  wp_remote_post()  in  spawn_cron() .",
      },
      {
        label = "cron_schedules",
        documentation = "applied to an empty array to allow a plugin to generate cron schedules in the  wp_get_schedules  function.",
      },
      { label = "custom_menu_order", documentation = "used to activate the ‘menu_order’ filter." },
      {
        label = "default_content",
        documentation = "applied to the default post content prior to opening the editor for a new post.",
      },
      {
        label = "default_excerpt",
        documentation = "applied to the default post excerpt prior to opening the editor for a new post.",
      },
      {
        label = "default_title",
        documentation = "applied to the default post title prior to opening the editor for a new post.",
      },
      {
        label = "editable_slug",
        documentation = "applied to the post, page, tag or category slug by the  get_sample_permalink  function.",
      },
      {
        label = "format_to_edit",
        documentation = "applied to post content, excerpt, title, and password by the  format_to_edit  function, which is called by the admin menus to set up a post for editing. Also applied to when editing comments in the admin menus.",
      },
      {
        label = "format_to_post",
        documentation = "applied to post content by the  format_to_post  function, which is not used in WordPress by default.",
      },
      {
        label = "manage_edit-${post_type}_columns",
        documentation = "applied to the list of columns to print on the manage posts screen for a custom post type. Filter function argument/return value is an associative array where the element key is the name of the column, and the value is the header text for that column. See also action  manage_${post_type}_posts_custom_column , which puts the column information into the edit screen.",
      },
      {
        label = "manage_link-manager_columns",
        documentation = "was  manage_link_columns  until wordpress 2.7. applied to the list of columns to print on the blogroll management screen. Filter function argument/return value is an associative list where the element key is the name of the column, and the value is the header text for that column. See also action  manage_link_custom_column , which puts the column information into the edit screen.",
      },
      {
        label = "manage_posts_columns",
        documentation = "applied to the list of columns to print on the manage posts screen. Filter function argument/return value is an associative array where the element key is the name of the column, and the value is the header text for that column. See also action  manage_posts_custom_column , which puts the column information into the edit screen. (see  Scompt’s tutorial  for examples and use.)",
      },
      {
        label = "manage_pages_columns",
        documentation = "applied to the list of columns to print on the manage pages screen. Filter function argument/return value is an associative array where the element key is the name of the column, and the value is the header text for that column. See also action  manage_pages_custom_column , which puts the column information into the edit screen.",
      },
      { label = "manage_users_columns", documentation = "" },
      { label = "manage_users_custom_column", documentation = "" },
      { label = "manage_users_sortable_columns", documentation = "" },
      {
        label = "media_row_actions",
        documentation = "applied to the list of action links under each file in the Media Library (like View, Edit).",
      },
      {
        label = "menu_order",
        documentation = "applied to the array for the admin menu order. Must be activated with the ‘custom_menu_order’ filter before.",
      },
      {
        label = "nonce_life",
        documentation = "applied to the lifespan of a  nonce  to generate or verify the nonce. Can be used to generate nonces which expire earlier. The value returned by the filter should be in seconds.",
      },
      {
        label = "nonce_user_logged_out",
        documentation = "applied to the current user ID used to generate or verify a  nonce  when the user is logged out.",
      },
      { label = "plugin_row_meta", documentation = "add additional links below each plugin on the plugins page." },
      {
        label = "postmeta_form_limit",
        documentation = "applied to the number of post-meta information items shown on the post edit screen.",
      },
      {
        label = "post_row_actions",
        documentation = "applied to the list of action links (like Quick Edit, Edit, View, Preview) under each post in the Posts > All Posts section.",
      },
      {
        label = "post_updated_messages",
        documentation = "applied to the array storing user-visible administrative messages when working with posts, pages and custom post types. This filter is used to change the text of said messages, not to trigger them. See “customizing the messages” in the  register_post_type  documentation.",
      },
      {
        label = "pre_upload_error",
        documentation = "applied to allow a plugin to create an XMLRPC error for uploading files.",
      },
      {
        label = "preview_page_link",
        documentation = "applied to the link on the page editing screen that shows the page preview at the bottom of the screen.",
      },
      {
        label = "preview_post_link",
        documentation = "applied to the link on the post editing screen that shows the post preview at the bottom of the screen.",
      },
      {
        label = "richedit_pre",
        documentation = "applied to post content by the  wp_richedit_pre  function, before displaying in the rich text editor.",
      },
      {
        label = "schedule_event",
        documentation = "applied to each recurring and single event as it is added to the cron schedule.",
      },
      { label = "set-screen-option", documentation = "Filter a screen option value before it is set." },
      {
        label = "show_password_fields",
        documentation = "applied to the true/false variable that controls whether the user is presented with the opportunity to change their password on the user profile screen (true means to show password changing fields; false means don’t).",
      },
      {
        label = "terms_to_edit",
        documentation = "applied to the CSV of terms (for each taxonomy) that is used to show which terms are attached to the post.",
      },
      {
        label = "the_editor",
        documentation = "applied to the HTML DIV created to house the rich text editor, prior to printing it on the screen. Filter function argument/return value is a string.",
      },
      {
        label = "user_can_richedit",
        documentation = "applied to the calculation of whether the user’s browser has rich editing capabilities, and whether the user wants to use the rich editor, in the  user_can_richedit  function. Filter function argument and return value is true/false if the current user can/cannot use the rich editor.",
      },
      {
        label = "user_has_cap",
        documentation = "applied to a user’s capabilities list in the  WP_User->has_cap  function (which is called by the  current_user_can  function). Filter function arguments are the capabilities list to be filtered, the capability being questioned, and the argument list (which has things such as the post ID if the capability is to edit posts, etc.)",
      },
      {
        label = "wp_handle_upload_prefilter",
        documentation = "applied to the upload information when uploading a file. Filter function argument: array which represents a single element of $_FILES.",
      },
      {
        label = "wp_handle_upload",
        documentation = "applied to the upload information when uploading a file. Filter function argument: array with elements “file” (file name), “url”, “type”.",
      },
      {
        label = "wp_revisions_to_keep",
        documentation = "alters how many revisions are kept for a given post. Filter function arguments: number representing desired revisions saved (default is unlimited revisions), the post object.",
      },
      {
        label = "wp_terms_checklist_args",
        documentation = "applied to arguments of the  wp_terms_checklist()   function. Filter function argument: array of checklist arguments, post ID.",
      },
      {
        label = "wp_upload_tabs",
        documentation = "applied to the list of custom tabs to display on the upload management admin screen. Use action  upload_files_(tab)  to display a page for your custom tab.",
      },
      {
        label = "media_upload_tabs",
        documentation = "applied to the list of custom tabs to display on the upload management admin screen. Use action  upload_files_(tab)  to display a page for your custom tab.",
      },
      {
        label = "plugin_action_links_(plugin file name)",
        documentation = "applied to the list of links to display on the plugins page (beside the activate/deactivate links).",
      },
      {
        label = "views_edit-post",
        documentation = "applied to the list posts eg All (30) | Published (22) | Draft (5) | Pending (2) | Trash (1)",
      },
      {
        label = "mce_spellchecker_languages",
        documentation = "applied to the language selection available in the spell checker.",
      },
      {
        label = "mce_buttons, mce_buttons_2, mce_buttons_3, mce_buttons_4",
        documentation = "applied to the rows of buttons for the rich editor toolbar (each is an array of button names).",
      },
      { label = "mce_css", documentation = "applied to the CSS file URL for the rich text editor." },
      {
        label = "mce_external_plugins",
        documentation = "applied to the array of external plugins to be loaded by the rich text editor.",
      },
      {
        label = "mce_external_languages",
        documentation = "applied to the array of language files loaded by external plugins, allowing them to use the standard translation method (see tinymce/langs/wp-langs.php for reference).",
      },
      { label = "tiny_mce_before_init", documentation = "applied to the whole init array for the editor." },
      {
        label = "locale_stylesheet_uri",
        documentation = "applied to the locale-specific stylesheet URI returned by the  get_locale_stylesheet_uri  function. Filter function arguments: URI, stylesheet directory URI.",
      },
      { label = "stylesheet", documentation = "applied to the stylesheet returned by the  get_stylesheet  function." },
      {
        label = "stylesheet_directory",
        documentation = "applied to the stylesheet directory returned by the  get_stylesheet_directory  function. Filter function arguments: stylesheet directory, stylesheet.",
      },
      {
        label = "stylesheet_directory_uri",
        documentation = "applied to the stylesheet directory URI returned by the  get_stylesheet_directory_uri  function. Filter function arguments: stylesheet directory URI, stylesheet.",
      },
      {
        label = "stylesheet_uri",
        documentation = "applied to the stylesheet URI returned by the  get_stylesheet_uri  function. Filter function arguments: stylesheet URI, stylesheet.",
      },
      { label = "template", documentation = "applied to the template returned by the  get_template  function." },
      {
        label = "template_directory",
        documentation = "applied to the template directory returned by the  get_template_directory  function. Filter function arguments: template directory, template.",
      },
      {
        label = "template_directory_uri",
        documentation = "applied to the template directory URI returned by the  get_template_directory_uri  function. Filter function arguments: template directory URI, template.",
      },
      {
        label = "theme_root",
        documentation = "applied to the theme root directory (normally wp-content/themes) returned by the  get_theme_root  function.",
      },
      {
        label = "theme_root_uri",
        documentation = "applied to the theme root directory URI returned by the  get_theme_root_uri  function. Filter function arguments: URI, site URL.",
      },
      {
        label = "404_template",
        documentation = "archive_template  : You can use this for example to enforce a specific template for a custom post type archive. This way you can keep all the code in a plugin. attachment_template  : author_template  : category_template  : comments_popup_template  : comments_template  : The “comments_template” filter can be used to load a custom template form a plugin which replace the themes default comment template. date_template  : home_template  : page_template  : paged_template  : search_template  : single_template  : You can use this for example to enforce a specific template for a custom post type. This way you can keep all the code in a plugin. shortcut_link  : applied to the “Press This” bookmarklet link. template_include  : wp_nav_menu_args  : applied to the arguments of the  wp_nav_menu  function. wp_nav_menu_items  : Filter the HTML list content for navigation menus.",
      },
      { label = "kubrick_header_color", documentation = "applied to the color for the header of the kubrick theme." },
      {
        label = "kubrick_header_display",
        documentation = "applied to the display option for the header of the kubrick theme.",
      },
      { label = "kubrick_header_image", documentation = "applied to the header image file for the kubrick theme." },
      {
        label = "authenticate",
        documentation = "allows basic authentication to be performed on login based on username and password.",
      },
      {
        label = "registration_errors",
        documentation = "applied to the list of registration errors generated while registering a user for a new account.",
      },
      {
        label = "user_registration_email",
        documentation = "applied to the user’s email address read from the registration page, prior to trying to register the person as a new user.",
      },
      {
        label = "validate_username",
        documentation = "applied to the validation result on a new user name. Filter function arguments: valid (true/false), user name being validated.",
      },
      {
        label = "wp_authenticate_user",
        documentation = "applied when a user attempted to log in, after WordPress validates username and password, but before validation errors are checked.",
      },
      {
        label = "allowed_redirect_hosts",
        documentation = "applied to the list of host names deemed safe for redirection. wp-login.php uses this to defend against a dangerous ‘redirect_to’ request parameter",
      },
      {
        label = "author_rewrite_rules",
        documentation = "applied to the author-related rewrite rules after they are generated.",
      },
      {
        label = "category_rewrite_rules",
        documentation = "applied to the category-related rewrite rules after they are generated.",
      },
      {
        label = "comments_rewrite_rules",
        documentation = "applied to the comment-related rewrite rules after they are generated.",
      },
      {
        label = "date_rewrite_rules",
        documentation = "applied to the date-related rewrite rules after they are generated.",
      },
      {
        label = "page_rewrite_rules",
        documentation = "applied to the page-related rewrite rules after they are generated.",
      },
      {
        label = "post_rewrite_rules",
        documentation = "applied to the post-related rewrite rules after they are generated.",
      },
      {
        label = "redirect_canonical",
        documentation = "Can be used to cancel a “canonical” URL redirect. Accepts 2 parameters:  $redirect_url ,  $requested_url . To cancel the redirect return  FALSE , to allow the redirect return  $redirect_url",
      },
      {
        label = "rewrite_rules_array",
        documentation = "applied to the entire rewrite rules array after it is generated.",
      },
      {
        label = "root_rewrite_rules",
        documentation = "applied to the root-level rewrite rules after they are generated.",
      },
      {
        label = "search_rewrite_rules",
        documentation = "applied to the search-related rewrite rules after they are generated.",
      },
      {
        label = "wp_redirect",
        documentation = "applied to a redirect URL by the default  wp_redirect  function. Filter function arguments: URL, HTTP status code.",
      },
      {
        label = "wp_redirect_status",
        documentation = "applied to the HTTP status code when redirecting by the default  wp_redirect  function. Filter function arguments: HTTP status code, URL.",
      },
      { label = "found_posts", documentation = "applied to the list of posts, just after querying from the database." },
      {
        label = "found_posts_query",
        documentation = "after the list of posts to display is queried from the database, WordPress selects rows in the query results. This filter allows you to do something other than  SELECT FOUND_ROWS()  at that step.",
      },
      {
        label = "post_limits",
        documentation = "applied to the  LIMIT  clause of the query that returns the post array.",
      },
      {
        label = "posts_clauses",
        documentation = "applied to the entire SQL query, divided into a keyed array for each clause type, that returns the post array. Can be easier to work with than  posts_request .",
      },
      {
        label = "posts_distinct",
        documentation = "allows a plugin to add a  DISTINCTROW  clause to the query that returns the post array.",
      },
      {
        label = "posts_fields",
        documentation = "applied to the field list for the query that returns the post array.",
      },
      {
        label = "posts_groupby",
        documentation = "applied to the  GROUP BY  clause of the query that returns the post array (normally empty).",
      },
      {
        label = "posts_join",
        documentation = "applied to the  JOIN  clause of the query that returns the post array. This is typically used to add a table to the  JOIN , in combination with the  posts_where  filter.",
      },
      {
        label = "posts_join_paged",
        documentation = "applied to the  JOIN  clause of the query that returns the post array, after the paging is calculated (though paging does not affect the JOIN, so this is actually equivalent to  posts_join ).",
      },
      {
        label = "posts_orderby",
        documentation = "applied to the  ORDER BY  clause of the query that returns the post array.",
      },
      {
        label = "posts_request",
        documentation = "applied to the entire SQL query that returns the post array, just prior to running the query.",
      },
      {
        label = "posts_results",
        documentation = "allows you to manipulate the resulting array returned from the query.",
      },
      {
        label = "posts_search",
        documentation = "applied to the search SQL that is used in the  WHERE  clause of  WP_Query .",
      },
      {
        label = "posts_where",
        documentation = "applied to the  WHERE  clause of the query that returns the post array.",
      },
      {
        label = "posts_where_paged",
        documentation = "applied to the  WHERE  clause of the query that returns the post array, after the paging is calculated (though paging does not affect the WHERE, so this is actually equivalent to  posts_where ).",
      },
      {
        label = "the_posts",
        documentation = "applied to the list of posts queried from the database after minimal processing for permissions and draft status on single-post pages.",
      },
      { label = "editor_max_image_size", documentation = "Filters the maximum image size dimensions for the editor." },
      { label = "image_downsize", documentation = "" },
      { label = "get_image_tag_class", documentation = "" },
      { label = "get_image_tag", documentation = "" },
      { label = "image_resize_dimensions", documentation = "" },
      { label = "intermediate_image_sizes", documentation = "" },
      { label = "icon_dir", documentation = "" },
      { label = "wp_get_attachment_image_attributes", documentation = "" },
      { label = "img_caption_shortcode", documentation = "" },
      { label = "post_gallery", documentation = "" },
      { label = "use_default_gallery_style", documentation = "" },
      { label = "gallery_style", documentation = "" },
      { label = "(adjacent)_image_link", documentation = "" },
      { label = "embed_defaults", documentation = "" },
      { label = "load_default_embeds", documentation = "" },
      { label = "embed_oembed_html", documentation = "" },
      { label = "embed_googlevideo", documentation = "" },
      { label = "oembed_result", documentation = "" },
      { label = "upload_size_limit", documentation = "" },
      { label = "wp_image_editors", documentation = "" },
      { label = "plupload_default_settings", documentation = "" },
      { label = "plupload_default_params", documentation = "" },
      { label = "image_size_names_choose", documentation = "" },
      { label = "wp_prepare_attachment_for_js", documentation = "" },
      { label = "media_upload_tabs", documentation = "" },
      { label = "disable_captions", documentation = "" },
      { label = "media_view_settings", documentation = "" },
      { label = "media_view_strings", documentation = "" },
      { label = "wp_handle_upload_prefilter", documentation = "" },
      {
        label = "create_user_query",
        documentation = "applied to the query used to save a new user’s information to the database, just prior to running the query.",
      },
      {
        label = "get_editable_authors",
        documentation = "applied to the list of post authors that the current user is authorized to edit in the  get_editable_authors  function.",
      },
      {
        label = "get_next_post_join",
        documentation = "in function  get_next_post  (which finds the post after the currently-displayed post), applied to the SQL JOIN clause (which normally joins to the category table if user is viewing a category archive). Filter function arguments: JOIN clause, stay in same category (true/false), list of excluded categories.",
      },
      {
        label = "get_next_post_sort",
        documentation = "in function  get_next_post  (which finds the post after the currently-displayed post), applied to the SQL ORDER BY clause (which normally orders by post date in ascending order with a limit of 1 post). Filter function arguments: ORDER BY clause.",
      },
      {
        label = "get_next_post_where",
        documentation = "in function  get_next_post  (which finds the post after the currently-displayed post), applied to the SQL WHERE clause (which normally looks for the next dated published post). Filter function arguments: WHERE clause, stay in same category (true/false), list of excluded categories.",
      },
      {
        label = "get_previous_post_join",
        documentation = "in function  get_previous_post  (which finds the post before the currently-displayed post), applied to the SQL JOIN clause (which normally joins to the category table if user is viewing a category archive). Filter function arguments: join clause, stay in same category (true/false), list of excluded categories.",
      },
      {
        label = "get_previous_post_sort",
        documentation = "in function  get_previous_post  (which finds the post before the currently-displayed post), applied to the SQL ORDER BY clause (which normally orders by post date in descending order with a limit of 1 post). Filter function arguments: ORDER BY clause.",
      },
      {
        label = "get_previous_post_where",
        documentation = "in function  get_previous_post  (which finds the post before the currently-displayed post), applied to the SQL WHERE clause (which normally looks for the previous dated published post). Filter function arguments: WHERE clause, stay in same category (true/false), list of excluded categories.",
      },
      {
        label = "gettext",
        documentation = "applied to the translated text by the  translation()  function (which is called by functions like the  __()  and  _e()  internationalization functions ). Filter function arguments: translated text, untranslated text and the text domain. Gets applied even if internationalization is not in effect or if the text domain has not been loaded.",
      },
      { label = "override_load_textdomain", documentation = "" },
      {
        label = "get_meta_sql",
        documentation = "in function  WP_Meta_Query::get_sql  (which generates SQL clauses to be appended to a main query for advanced meta queries.), applied to the SQL JOIN and WHERE clause generated by the advanced meta query. Filter function arguments: array( compact( ‘join’, ‘where’ ), $this->queries, $type, $primary_table, $primary_id_column, $context )",
      },
      {
        label = "get_others_drafts",
        documentation = "applied to the query that selects the other users’ drafts for display in the admin menus.",
      },
      {
        label = "get_users_drafts",
        documentation = "applied to the query that selects the users’ drafts for display in the admin menus.",
      },
      { label = "locale", documentation = "applied to the locale by the  get_locale  function." },
      {
        label = "query",
        documentation = "applied to all queries (at least all queries run after plugins are loaded).",
      },
      {
        label = "request",
        documentation = "like  query_vars , but applied after “extra” and private query variables have been added.",
      },
      { label = "excerpt_length", documentation = "Defines the length of a single-post excerpt." },
      { label = "excerpt_more", documentation = "Defines the more string at the end of the excerpt." },
      {
        label = "post_edit_form_tag",
        documentation = "Allows you to append code to the form tag in the default post/page editor.",
      },
      {
        label = "update_user_query",
        documentation = "applied to the update query used to update user information, prior to running the query.",
      },
      { label = "xmlrpc_methods", documentation = "applied to list of defined XMLRPC methods for the XMLRPC server." },
      {
        label = "wp_mail_from",
        documentation = "applied before any mail is sent by the wp_mail function. Supplied value is the calculated from address which is wordpress at the current hostname (set by $_SERVER[‘SERVER_NAME’]). The filter should return an email address or name/email combo in the form “user@example.com” or “Name <user@example.com>” (without the quotes!).",
      },
      {
        label = "wp_mail_from_name",
        documentation = "applied before any mail is sent by the wp_mail function. The filter should return a name string to be used as the email from name.",
      },
      {
        label = "update_(meta_type)_metadata",
        documentation = "applied before a metadata gets updated. For example if a user metadata gets updated the hook would be ‘update_user_metadata’",
      },
      {
        label = "dynamic_sidebar_params",
        documentation = "applied to the arguments passed to the widgets_init function in the WordPress widgets.",
      },
      {
        label = "widget_archives_dropdown_args",
        documentation = "applied to the arguments passed to the  wp_get_archives()  function in the WordPress Archives widget.",
      },
      {
        label = "widget_categories_args",
        documentation = "applied to the arguments passed to the  wp_list_categories()  function in the WordPress Categories widget.",
      },
      {
        label = "widget_links_args",
        documentation = "applied to the arguments passed to the  wp_list_bookmarks()  function in the WordPress Links widget.",
      },
      {
        label = "widget_nav_menu_args",
        documentation = "applied to the arguments passed to the  wp_nav_menu()  function in the WordPress Custom Menu widget.",
      },
      {
        label = "widget_pages_args",
        documentation = "applied to the arguments passed to the  wp_list_pages()  function in the WordPress Pages widget.",
      },
      {
        label = "widget_tag_cloud_args",
        documentation = "applied to the arguments passed to the  wp_tag_cloud()  function in the WordPress Pages widget.",
      },
      {
        label = "widget_text",
        documentation = "applied to the widget text of the WordPress Text widget. May also apply to some third party widgets as well.",
      },
      {
        label = "widget_title",
        documentation = "applied to the widget title of any user editable WordPress Widget. May also apply to some third party widgets as well.",
      },
      {
        label = "wp_admin_bar_class",
        documentation = "allows changing the default ‘ WP_Admin_Bar ’ class in the  _wp_admin_bar_init()  function in .",
      },
    },
  })
end

function M:new()
  return setmetatable({}, { __index = M })
end

return M
