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
  if not vim.api.nvim_get_current_line():match("add_action%(") then
    return callback({ items = {} })
  end
  return callback({
    items = {
      {
        label = "post_submitbox_misc_actions",
        documentation = "Runs when an editing page gets generated to add some content (eg. fields) to the submit box (where the publish button is shown). No function arguments.",
      },
      {
        label = "add_attachment",
        documentation = "Runs when an attached file is first added to the database. Action function arguments: attachment ID.",
      },
      { label = "add_category", documentation = "Same as  create_category ." },
      {
        label = "{$taxonomy}_add_form_fields",
        documentation = "Runs when a taxonomy add form is cerated in admin. Useful to add a field in this form before the submit button. For example  category_add_form_fields .",
      },
      {
        label = "{$taxonomy}_edit_form",
        documentation = "Runs when taxonomy term edit form is created in admin. Useful to add a new field to this form.",
      },
      {
        label = "clean_post_cache",
        documentation = "Runs when post cache is cleaned. Action function arguments: post ID. See  clean_post_cache() .",
      },
      {
        label = "create_{$taxonomy}",
        documentation = "Runs when a new taxonomy term is created. Action function arguments: term ID.",
      },
      {
        label = "delete_attachment",
        documentation = "Runs just before an attached file is deleted from the database. Action function arguments: attachment ID. ''(Prior to version 2.8 this hook was triggered after attachment was deleted.)",
      },
      {
        label = "delete_{$taxonomy}",
        documentation = "Runs just after a taxonomy term is deleted from the database and its corresponding links/posts are updated to remove the term. Action function arguments: Term ID.",
      },
      {
        label = "wp_trash_post",
        documentation = "Runs when a post or page is about to be trashed. Action function arguments: post or page ID.",
      },
      {
        label = "trashed_post",
        documentation = "Runs just after a post or page is trashed. Action function arguments: post or page ID.",
      },
      {
        label = "untrash_post",
        documentation = "Runs just before undeletion, when a post or page is restored. Action function arguments: post or page ID.",
      },
      {
        label = "untrashed_post",
        documentation = "Runs just after undeletion, when a post or page is restored. Action function arguments: post or page ID.",
      },
      {
        label = "before_delete_post",
        documentation = "Runs when a post or page is about to be deleted. Comments, attachments and metadata are still available. Action function arguments: post or page ID.",
      },
      {
        label = "delete_post",
        documentation = "Runs when a post or page is about to be deleted. Comments, attachments and metadata are already deleted. Action function arguments: post or page ID.",
      },
      {
        label = "deleted_post",
        documentation = "Runs just after a post or page is deleted. Action function arguments: post or page ID.",
      },
      {
        label = "edit_attachment",
        documentation = "Runs when an attached file is edited/updated to the database. Action function arguments: attachment ID.",
      },
      {
        label = "edit_category",
        documentation = "Runs when a category is updated/edited, including when a post or blogroll link is added/deleted or its categories are updated (which causes the count for the category to update). Action function arguments: category ID.",
      },
      {
        label = "edit_post",
        documentation = "Runs when a post or page is updated/edited, including when a comment is added or updated (which causes the comment count for the post to update). Action function arguments: post or page ID.",
      },
      {
        label = "pre_post_update",
        documentation = "Runs just before a post or page is updated. Action function arguments: post or page ID.",
      },
      {
        label = "post_updated",
        documentation = "Runs after a post or page is updated. Action function arguments: post or page ID,  WP_Post  object of the post before the update and after the update.",
      },
      {
        label = "transition_post_status",
        documentation = "Runs when any post status transition occurs. Action function arguments:  $new_status ,  $old_status ,  $post  object. (See also  Post Status Transitions .)",
      },
      {
        label = "(old status)to(new status)",
        documentation = "(old status) to (new status)  : Runs when a post changes status from  $old_status  to  $new_status . Action function arguments:  $post  object. (See also  Post Status Transitions .)",
      },
      {
        label = "{$new_status}_{$post->post_type}",
        documentation = "Runs when a post of type  $post_type  is transitioned to  $status  from any other status. Action function arguments: post ID,  $post object . (See also  Post Status Transitions .)",
      },
      {
        label = "publish_page",
        documentation = "Runs when a page is published, or if it is edited and its status is changed to “published”. This action hook conforms to the  {$new_status}_{$post->post_type}  action hook type. Action function arguments: post ID,  $post object . (See also  Post Status Transitions .)",
      },
      {
        label = "publish_phone",
        documentation = "Runs just after a post is added via email. Action function argument: post ID.",
      },
      {
        label = "save_post_{$post->post_type}",
        documentation = "Runs whenever a post of specified post_type is created or updated, which could be from an import, post/page edit form, xmlrpc, or post by email. Action function arguments: post ID and post object. Runs after the data is saved to the database. Note that post ID may reference a post revision and not the last saved post. Use  wp_is_post_revision()  to get the ID of the real post.",
      },
      {
        label = "save_post",
        documentation = "Runs whenever a post or page is created or updated, which could be from an import, post/page edit form, xmlrpc, or post by email. Action function arguments: post ID and post object. Runs after the data is saved to the database. Note that post ID may reference a post revision and not the last saved post. Use  wp_is_post_revision()  to get the ID of the real post.",
      },
      { label = "updated_postmeta", documentation = "Runs when a metadata has been updated." },
      { label = "wp_insert_post", documentation = "Same as  save_post , runs immediately afterwards." },
      {
        label = "xmlrpc_publish_post",
        documentation = "Runs when a post is published via XMLRPC request, or if it is edited via XMLRPC and its status is “published”. Action function arguments: post ID.",
      },
      { label = "create_term", documentation = "Runs after a new term is created, before the term cache is cleaned." },
      {
        label = "created_term",
        documentation = "Runs after a new term is created, and after the term cache has been cleaned.",
      },
      { label = "create_$taxonomy", documentation = "Runs after a new term is created for a specific taxonomy." },
      {
        label = "created_$taxonomy",
        documentation = "Runs after a new term in a specific taxonomy is created, and after the term cache has been cleaned.",
      },
      {
        label = "add_term_relationship",
        documentation = "(Since version 2.9.0) : Runs before an object-term relationship is added.",
      },
      {
        label = "added_term_relationship",
        documentation = "(Since version 2.9.0) : Runs after an object-term relationship is added.",
      },
      {
        label = "set_object_terms",
        documentation = "(Since version 2.8.0) : Runs after an object’s terms have been set.",
      },
      { label = "edit_terms", documentation = "(Since version 2.9.0) : Runs before the given terms are edited." },
      { label = "edited_terms", documentation = "Runs after saving taxonomy/category change in the database." },
      { label = "edit_term_taxonomy", documentation = "Runs before a term-taxonomy relationship is updated." },
      { label = "edited_term_taxonomy", documentation = "Runs after a term-taxonomy relationship is updated." },
      {
        label = "edit_term_taxonomies",
        documentation = "(Since version 2.9.0) : Runs before a term to delete’s children are reassigned a parent.",
      },
      {
        label = "edited_term_taxonomies",
        documentation = "(Since version 2.9.0) : Runs after a term to delete’s children are reassigned a parent.",
      },
      { label = "edit_$taxonomy", documentation = "Runs after a term is edited for a specific taxonomy." },
      {
        label = "edited_$taxonomy",
        documentation = "Runs after a term in a specific taxonomy is edited, and after the term cache has been cleaned.",
      },
      {
        label = "pre_delete_term",
        documentation = "(Since version 4.1.0) : Runs before any modifications are made to posts or terms.",
      },
      {
        label = "delete_term_taxonomy",
        documentation = "(Since version 2.9.0) : Runs before a term taxonomy ID is deleted from database (after having change chidren’s term).",
      },
      {
        label = "deleted_term_taxonomy",
        documentation = "(Since version 2.9.0) : Runs after a term taxonomy ID is deleted.",
      },
      {
        label = "delete_term",
        documentation = "(Since version 2.5.0) : Runs after a term is deleted from the database and the cache is cleaned. (Paramètres : $Term_ID, $Term_taxonomy_ID, $Taxonomy_slug, $already_deleted_term)",
      },
      {
        label = "delete_$taxonomy",
        documentation = "(Since version 2.3.0) : Runs after a term in a specific taxonomy is deleted. (Paramètres : $Term_ID, $Term_taxonomy_ID, $already_deleted_term)",
      },
      {
        label = "delete_term_relationships",
        documentation = "(Since version 2.9.0) : Runs before an object-term relationship is deleted.",
      },
      {
        label = "deleted_term_relationships",
        documentation = "(Since version 2.9.0) : Runs after an object-term relationship is deleted.",
      },
      {
        label = "clean_object_term_cache",
        documentation = "(Since version 2.5.0) : Runs after the object term cache has been cleaned.",
      },
      {
        label = "clean_term_cache",
        documentation = "(Since version 2.5.0) : Runs after each taxonomy’s term cache has been cleaned.",
      },
      {
        label = "split_shared_term",
        documentation = "(Since version 4.2.0) : Runs after a previously shared taxonomy term is split into two separate terms.",
      },
      {
        label = "pre_term_{$field}",
        documentation = "Runs before a taxonomy term’s data is saved to the database. For example,  pre_term_description .",
      },
      {
        label = "pre_{$taxonomy}_{$field}",
        documentation = "Runs before a term’s field is saved to the database. For example,  pre_category_description .",
      },
      {
        label = "comment_closed",
        documentation = "Runs when the post is marked as not allowing comments while trying to display comment entry form. Action function argument: post ID.",
      },
      {
        label = "comment_id_not_found",
        documentation = "Runs when the post ID is not found while trying to display comments or comment entry form. Action function argument: post ID.",
      },
      {
        label = "comment_flood_trigger",
        documentation = "Runs when a comment flood is detected, just before  wp_die  is called to stop the comment from being accepted. Action function arguments: time of previous comment, time of current comment.",
      },
      {
        label = "comment_{$old_status}_to_{$new_status}",
        documentation = "comment_{$old_status} _to_ {$new_status}  : Runs when a comment status transition occurs. Action function arguments: Comment object.",
      },
      {
        label = "comment_on_draft",
        documentation = "Runs when the post is a draft while trying to display a comment entry form or comments. Action function argument: post ID.",
      },
      {
        label = "comment_post",
        documentation = "Runs just after a comment is saved in the database. Action function arguments: comment ID, approval status (“spam”, or 0/1 for disapproved/approved).",
      },
      {
        label = "edit_comment",
        documentation = "Runs after a comment is updated/edited in the database. Action function arguments: comment ID.",
      },
      {
        label = "delete_comment",
        documentation = "Fires immediately before a comment is deleted from the database. Action function arguments: comment ID.",
      },
      {
        label = "deleted_comment",
        documentation = "Fires immediately after a comment is deleted from the database. Action function arguments: comment ID.",
      },
      {
        label = "trash_comment",
        documentation = "Fires immediately before a comment is sent to the Trash. Action function arguments: comment ID.",
      },
      {
        label = "trashed_comment",
        documentation = "Fires immediately after a comment is sent to Trash. Action function arguments: comment ID.",
      },
      {
        label = "untrash_comment",
        documentation = "Fires immediately before a comment is restored from the Trash. Action function arguments: comment ID.",
      },
      {
        label = "untrashed_comment",
        documentation = "Fires immediately after a comment is restored from the Trash. Action function arguments: comment ID.",
      },
      {
        label = "spam_comment",
        documentation = "Fires immediately before a comment is marked as Spam. Action function arguments: comment ID.",
      },
      {
        label = "spammed_comment",
        documentation = "Fires immediately after a comment is marked as Spam. Action function arguments: comment ID.",
      },
      {
        label = "unspam_comment",
        documentation = "Fires immediately before a comment is unmarked as Spam. Action function arguments: comment ID.",
      },
      {
        label = "unspammed_comment",
        documentation = "Fires immediately after a comment is unmarked as Spam. Action function arguments: comment ID.",
      },
      {
        label = "pingback_post",
        documentation = "Runs when a ping is added to a post. Action function argument: comment ID.",
      },
      {
        label = "pre_ping",
        documentation = "Runs before a ping is fully processed. Action function arguments: array of the post links to be processed, and the “pung” setting for the post.",
      },
      {
        label = "trackback_post",
        documentation = "Runs when a trackback is added to a post. Action function argument: comment ID.",
      },
      {
        label = "wp_blacklist_check",
        documentation = "Runs to check whether a comment should be blacklisted. Action function arguments: author name, author email, author URL, comment text, author IP address, author’s user agent (browser). Your function can execute a  wp_die  to reject the comment, or perhaps modify one of the input arguments so that it will contain one of the blacklist keywords set in the WordPress options.",
      },
      { label = "wp_insert_comment", documentation = "Runs whenever a comment is created." },
      {
        label = "wp_set_comment_status",
        documentation = "Runs when the status of a comment changes. Action function arguments: comment ID, status string indicating the new status (“delete”, “approve”, “spam”, “hold”).",
      },
      {
        label = "add_link",
        documentation = "Runs when a new blogroll link is first added to the database. Action function arguments: link ID.",
      },
      {
        label = "delete_link",
        documentation = "Runs when a blogroll link is deleted. Action function arguments: link ID.",
      },
      {
        label = "edit_link",
        documentation = "Runs when a blogroll link is edited. Action function arguments: link ID.",
      },
      {
        label = "atom_entry",
        documentation = "Runs just after the entry information has been printed (but before closing the entry tag) for each blog entry in an atom feed.",
      },
      {
        label = "atom_head",
        documentation = "Runs just after the blog information has been printed in an atom feed, just before the first entry.",
      },
      { label = "atom_ns", documentation = "Runs inside the root XML element for an atom feed (to add namespaces)." },
      {
        label = "commentrss2_item",
        documentation = "Runs just after a single comment’s information has been printed in a comment feed (but before closing the item tag). Action function arguments: comment ID, post ID.",
      },
      {
        label = "do_feed_{$feed}",
        documentation = "Runs when a feed is generated, where  feed  is the type of feed ( rss2, atom, rdf , etc.). Use  priority  less than 10 to run  before  printing the feed. Action function argument:  true  (the feed is for comments) or  false  (it is for posts).",
      },
      {
        label = "rdf_header",
        documentation = "Runs just after the blog information has been printed in an RDF feed, just before the first entry.",
      },
      {
        label = "rdf_item",
        documentation = "Runs just after the entry information has been printed (but before closing the item tag) for each blog entry in an RDF feed.",
      },
      { label = "rdf_ns", documentation = "Runs inside the root XML element in an RDF feed (to add namespaces)." },
      {
        label = "rss_head",
        documentation = "Runs just after the blog information has been printed in an RSS feed, just before the first entry.",
      },
      {
        label = "rss_item",
        documentation = "Runs just after the entry information has been printed (but before closing the item tag) for each blog entry in an RSS feed.",
      },
      {
        label = "rss2_head",
        documentation = "Runs just after the blog information has been printed in an RSS 2 feed, just before the first entry.",
      },
      {
        label = "rss2_item",
        documentation = "Runs just after the entry information has been printed (but before closing the item tag) for each blog entry in an RSS 2 feed.",
      },
      { label = "rss2_ns", documentation = "Runs inside the root XML element in an RSS 2 feed (to add namespaces)." },
      {
        label = "after_setup_theme",
        documentation = "Runs during a themes initialization. Is generally used to perform basic setup, registration, and init actions for a theme.",
      },
      {
        label = "comment_form",
        documentation = "Runs at the bottom of a comment form rendered by  comment_form() , right before the closing",
      },
      {
        label = "comment_form_after",
        documentation = "Runs after the comment form is rendered by  comment_form() , right after the closing",
      },
      {
        label = "do_robots",
        documentation = "Runs when the template file chooser determines that it is a robots.txt request.",
      },
      {
        label = "do_robotstxt",
        documentation = "Runs in the  do_robots()  function before it prints out the Disallow lists for the robots.txt file.",
      },
      {
        label = "get_footer",
        documentation = "Runs when the template calls the  get_footer()  function, just before the  footer.php  template file is loaded.",
      },
      {
        label = "get_header",
        documentation = "Runs when the template calls the  get_header()  function, just before the  header.php  template file is loaded.",
      },
      {
        label = "switch_theme",
        documentation = "Runs when the blog’s theme is changed. Action function argument: name of the new theme. If used in a theme, it only works if the theme that adds action is the one being disabled.",
      },
      {
        label = "after_switch_theme",
        documentation = "Runs when the blog’s theme is changed. Action function argument: name of the new theme. If used in a theme, it only works if the theme that adds action is the one being enabled. Can be used to run certain code when enabling a theme.",
      },
      {
        label = "load-themes.php",
        documentation = "Runs when the theme is activate or deactivate (replace by an other).",
      },
      {
        label = "template_redirect",
        documentation = "Runs before the determination of the template file to be used to display the requested page.",
      },
      {
        label = "wp_footer",
        documentation = "Runs when the template calls the  wp_footer()  function, generally near the bottom of the blog page.",
      },
      {
        label = "wp_head",
        documentation = "Runs when the template calls the  wp_head()  function. This hook is generally placed near the top of a page template between",
      },
      {
        label = "wp_meta",
        documentation = "Runs when the  sidebar.php  template file calls the  wp_meta()  function, to allow the plugin to insert content into the sidebar.",
      },
      {
        label = "wp_print_scripts",
        documentation = "Runs just before WordPress prints registered JavaScript scripts into the page header.",
      },
      {
        label = "activate_{$plugin}",
        documentation = "Runs when the plugin is first activated. See  Function_Reference/register_activation_hook .",
      },
      {
        label = "activity_box_end",
        documentation = "Runs at the end of the activity box on the admin Dashboard screen.",
      },
      {
        label = "add_category_form_pre",
        documentation = "Runs before the add category form is put on the screen in the admin menus.",
      },
      {
        label = "add_option_{$option}",
        documentation = "Runs after a WordPress option has been added by the  add_option()  function. Action function arguments: option name, option value. You must add an action for the specific options that you want to respond to, such as ‘add_option_foo’ to respond when option “foo” has been added.",
      },
      { label = "add_option", documentation = "Runs before an option gets added to the database." },
      { label = "added_option", documentation = "Runs after an an option has been added." },
      { label = "admin_head", documentation = ":Runs in the HTML" },
      { label = "admin_head-{$hook_suffix}", documentation = "Runs in the HTML" },
      {
        label = "admin_init",
        documentation = "Runs at the beginning of every admin page before the page is rendered. See  wp-admin/admin.php ,  wp-admin/admin-post.php , and  wp-admin/admin-ajax.php .",
      },
      { label = "admin_footer-{$hook_suffix}", documentation = "Runs at the end of the" },
      {
        label = "admin_post_{$action}",
        documentation = "also:  admin_post_nopriv_{$action}  – Runs a handler for an unspecified GET or POST request.",
      },
      { label = "admin_footer", documentation = "Runs at the end of the admin panel inside the body tag" },
      {
        label = "admin_enqueue_scripts",
        documentation = "Runs in the HTML header so a plugin or theme can enqueue JavaScript and CSS to all admin pages.",
      },
      {
        label = "admin_print_scripts",
        documentation = "Runs in the HTML header so a plugin can add JavaScript scripts to all admin pages.",
      },
      {
        label = "admin_print_scripts-{$hook_suffix}",
        documentation = "Runs to print JavaScript scripts in the HTML head section of a specific plugin-generated admin page. The (page_hook) is returned when using any of the functions that add plugin menu items to the admin menu:  add_management_page()  ,  add_options_page()  , etc. Example:",
      },
      {
        label = "admin_print_styles",
        documentation = "Runs in the HTML header so a plugin can add CSS/Stylesheets to all admin pages.",
      },
      {
        label = "admin_print_styles-{$hook_suffix}",
        documentation = "Runs when styles should be enqueued with  wp_enqueue_style()  for a particular admin page. Use the return value of a function such as  add_submenu_page()  to determine the value of  (page_hook) .",
      },
      {
        label = "check_passwords",
        documentation = "Runs to validate the double-entry of password when creating a new user. Action function arguments: array of login name, first password, second password.",
      },
      {
        label = "dbx_post_advanced",
        documentation = "Runs at the bottom of the “advanced” section on the page editing screen in the admin menus.",
      },
      {
        label = "dbx_post_sidebar",
        documentation = "Runs at the bottom of the sidebar on the page editing screen in the admin menus.",
      },
      {
        label = "dbx_post_advanced",
        documentation = "Runs at the bottom of the “advanced” section on the post editing screen in the admin menus.",
      },
      {
        label = "dbx_post_sidebar",
        documentation = "Runs at the bottom of the sidebar on the post editing screen in the admin menus. Use  add_meta_box()  in WordPress 2.5 and higher.",
      },
      { label = "deactivate_{$plugin}", documentation = "Runs when a plugin is deactivated." },
      {
        label = "delete_option_{$option}",
        documentation = "Runs after a WordPress option has been deleted by the  delete_option()  function. Action function arguments: option name. You must add an action for the specific options that you want to respond to, such as ‘delete_option_foo’ to respond when option “foo” has been deleted.",
      },
      { label = "delete_option", documentation = "Runs before an option gets deleted from the database." },
      { label = "deleted_option", documentation = "Runs after an an option has been deleted." },
      { label = "delete_user", documentation = "Runs when a user is deleted. Action function arguments: user ID." },
      {
        label = "edit_category_form",
        documentation = "Runs after the add/edit category form is put on the screen (but before the end of the HTML form tag).",
      },
      {
        label = "edit_category_form_pre",
        documentation = "Runs before the edit category form is put on the screen in the admin menus.",
      },
      {
        label = "edit_tag_form",
        documentation = "Runs after the add/edit tag form is put on the screen (but before the end of the HTML form tag).",
      },
      {
        label = "edit_tag_form_pre",
        documentation = "Runs before the edit tag form is put on the screen in the admin menus.",
      },
      {
        label = "edit_form_top",
        documentation = "Runs inside the form before the title on WordPress post edit screen (and Custom Post Types), but after the inital hidden fields (user_ID, action, etc.).",
      },
      {
        label = "edit_form_after_title",
        documentation = "Runs after the title on WordPress post edit screen (and Custom Post Types) but before the built in WordPress content area.",
      },
      {
        label = "edit_form_after_editor",
        documentation = "Runs just after the WordPress post editor but before all other meta boxes. also available in Custom Post Types.",
      },
      {
        label = "edit_form_advanced",
        documentation = "Runs just before the “advanced” section of the post editing form in the admin menus.",
      },
      {
        label = "edit_page_form",
        documentation = "Runs just before the “advanced” section of the page editing form in the admin menus.",
      },
      {
        label = "edit_user_profile",
        documentation = "Runs near the end of the user profile editing screen in the admin menus.",
      },
      {
        label = "load-{$pagenow}",
        documentation = "Runs when an administration menu page is loaded. This action is not usually added directly — see  Adding Administration Menus  for more details of how to add admin menus. If you do want to use it directly, the return value from  add_options_page()  and similar functions gives you the “(page)” part of the action name.",
      },
      { label = "login_form", documentation = "Runs just before the end of the login form." },
      { label = "login_head", documentation = "Runs just before the end of the HTML head section of the login page." },
      {
        label = "lost_password",
        documentation = "Runs before the “retrieve your password by email” form is printed on the login screen.",
      },
      {
        label = "lostpassword_form",
        documentation = "Runs at the end of the form used to retrieve a user’s password by email, to allow a plugin to supply extra fields.",
      },
      {
        label = "lostpassword_post",
        documentation = "runs when the user has requested an email message to retrieve their password, to allow a plugin to modify the PHP  $_POST  variable before processing.",
      },
      {
        label = "manage_link_custom_column",
        documentation = "Runs when there is an unknown column name for an admin screen. Action function arguments: column name, link ID. See also filter  id}_columns  in the  Plugin API/Filter Reference , which adds custom columns.",
      },
      {
        label = "manage_posts_custom_column",
        documentation = "Runs when there is an unknown column name for the managing posts admin screen. Action function arguments: column name, post ID. See also filter  manage_posts_columns  in the  Plugin API/Filter Reference , which adds custom columns. (see  Scompt’s tutorial  for examples and use.)",
      },
      {
        label = "manage_pages_custom_column",
        documentation = "Runs when there is an unknown column name for the managing pages admin screen. Action function arguments: column name, page ID. See also filter  manage_pages_columns  in the  Plugin API/Filter Reference , which adds custom columns.",
      },
      {
        label = "manage_media_custom_column",
        documentation = "Runs when there is an unknown column name for the managing media admin screen. Action function arguments: column name, page ID. See also filter  manage_media_columns  in the  Plugin API/Filter Reference , which adds custom columns.",
      },
      {
        label = "manage_{$post->post_type}_posts_custom_column",
        documentation = "Runs when there is an unknown column name for the managing custom post type admin screen. Action function arguments: column name, post ID. See also filter  manage_{$post_type}_posts_columns , which adds custom columns for custom post types.",
      },
      {
        label = "password_reset",
        documentation = "Runs before the user’s password is reset to a random new password.",
      },
      {
        label = "personal_options_update",
        documentation = "Runs when a user updates personal options from the admin screen.",
      },
      { label = "plugins_loaded", documentation = "Runs after all plugins have been loaded." },
      {
        label = "profile_personal_options",
        documentation = "Runs at the end of the Personal Options section of the user profile editing screen.",
      },
      {
        label = "profile_update",
        documentation = "Runs when a user’s profile is updated. Action function argument: user ID.",
      },
      {
        label = "quick_edit_custom_box",
        documentation = "Runs when there is an unknown column name when creating the quick editor.",
      },
      { label = "register_form", documentation = "Runs just before the end of the new user registration form." },
      { label = "register_post", documentation = "Runs before a new user registration request is processed." },
      {
        label = "restrict_manage_posts",
        documentation = "Runs before the list of posts to edit is put on the screen in the admin menus.",
      },
      {
        label = "retrieve_password",
        documentation = "Runs when a user’s password is retrieved, to send them a reminder email. Action function argument: login name.",
      },
      {
        label = "set_current_user",
        documentation = "Runs after the user has been changed by the default  wp_set_current_user()  function. Note that  wp_set_current_user()  is also a “pluggable” function, meaning that plugins can override it; see  Plugin API ).",
      },
      { label = "show_user_profile", documentation = "Runs near the end of the user profile editing screen." },
      { label = "sidebar_admin_page", documentation = "Runs after the main content on the widgets admin page." },
      { label = "sidebar_admin_setup", documentation = "Runs early when editing the widgets displayed in sidebars." },
      {
        label = "update_option_{$option}",
        documentation = "Runs after a WordPress option has been updated by the  update_option()  function. Action function arguments: old option value, new option value. You must add an action for the specific options that you want to respond to, such as ‘update_option_foo’ to respond when option “foo” has been updated.",
      },
      { label = "update_option", documentation = "Runs before an option gets updated to the database." },
      { label = "updated_option", documentation = "Runs after an option has been updated." },
      {
        label = "user_new_form",
        documentation = "Runs near the end of the “Add New” user screen. Action function argument: Passes the string “add-existing-user” on multisite or “add-new-user” on single site and for network admins.",
      },
      {
        label = "user_profile_update_errors",
        documentation = "Runs just before updated user details are committed to the database.",
      },
      {
        label = "wpmu_new_user",
        documentation = "Runs when a user’s profile is first created in a Multisite environment. Action function argument: user ID. If not in Multisite then use user_register.",
      },
      {
        label = "user_register",
        documentation = "Runs when a user’s profile is first created. Action function argument: user ID.",
      },
      {
        label = "welcome_panel",
        documentation = "Allows you to hide the Welcome Panel in the Dashboard. This is also a smart filter, which hides the related Screen Option.",
      },
      {
        label = "wp_ajax_{$action}",
        documentation = "also:  wp_ajax_nopriv_{$action}  – Runs to do an unknown type of AJAX request handler.",
      },
      {
        label = "wp_authenticate",
        documentation = "Runs to authenticate a user when they log in. Action function arguments: array with user name and password.",
      },
      { label = "wp_login", documentation = "Runs when a user logs in." },
      { label = "wp_logout", documentation = "Runs when a user logs out." },
      { label = "activated_plugin", documentation = "Runs any time any plugin is successfully activated" },
      { label = "add_meta_boxes", documentation = "Runs when “edit post” page loads. ( 3.0+ )" },
      { label = "admin_menu", documentation = "Runs after the basic admin panel menu structure is in place." },
      {
        label = "network_admin_notices",
        documentation = "Runs after the admin menu is printed to network admin screens.",
      },
      { label = "user_admin_notices", documentation = "Runs after the admin menu is printed to user admin screens." },
      {
        label = "admin_notices",
        documentation = "Runs after the admin menu is printed to screens that aren’t network- or user-admin screens.",
      },
      { label = "all_admin_notices", documentation = "Runs after the admin menu is printed to all screens." },
      {
        label = "blog_privacy_selector",
        documentation = "Runs after the default blog privacy options are printed on the screen.",
      },
      {
        label = "check_admin_referer",
        documentation = "Runs in the default  check_admin_referrer()  function after the nonce has been checked for security purposes, to allow a plugin to force WordPress to die for extra security reasons. Note that  check_admin_referrer  is also a “pluggable” function, meaning that plugins can override it; see  Plugin API ).",
      },
      {
        label = "check_ajax_referer",
        documentation = "Runs in the default  check_ajax_referer()  function (which is called when an AJAX request goes to the  wp-admin/admin-ajax.php  script) after the user’s login and password have been successfully validated from cookies, to allow a plugin to force WordPress to die for extra security reasons. Note that  check_ajax_referer  is also a “pluggable” function, meaning that plugins can override it; see  Plugin API ).",
      },
      {
        label = "customize_controls_enqueue_scripts",
        documentation = "triggered after the WP Theme Customizer after customize_controls_init was called, its actions/callbacks executed, and its own styles and scripts enqueued, so you can use this hook to register your own scripts and styles for WP Theme Customizer. For use with the  Theme Customization API  (as of  Version 3.4 ).",
      },
      {
        label = "customize_register",
        documentation = "Runs on every request, allowing developers to register new theme options and controls for use with the  Theme Customization API  (as of  Version 3.4 ).",
      },
      {
        label = "customize_preview_init",
        documentation = "Allows you to enqueue assets (such as javascript files) directly in the Theme Customizer only. For use with the  Theme Customization API  (as of  Version 3.4 ).",
      },
      { label = "deactivated_plugin", documentation = "Runs any time any plugin is successfully de-activated" },
      {
        label = "generate_rewrite_rules",
        documentation = "Runs after the rewrite rules are generated. Action function arguments:  WP_Rewrite  object ( $wp_rewrite ) by reference. Note that it is easier to use the r ewrite_rules_array  filter instead of this action, to modify the rewrite rules.",
      },
      {
        label = "init",
        documentation = "Runs after WordPress has finished loading but before any headers are sent. Useful for intercepting $_GET or $_POST triggers.",
      },
      { label = "loop_end", documentation = "Runs after the last post of the WordPress loop is processed." },
      { label = "loop_start", documentation = "Runs before the first post of the WordPress loop is processed." },
      {
        label = "network_admin_menu",
        documentation = "Runs when the basic menu structure is prepared for the  Network  administration page. ( Administration Menus )",
      },
      {
        label = "parse_query",
        documentation = "Runs at the end of query parsing in  the main query  or any instance of  WP_Query , such as  query_posts ,  get_posts , or  get_children . Action function arguments:  WP_Query  object by reference.",
      },
      {
        label = "parse_request",
        documentation = "Runs after the query request is parsed inside the main WordPress function  wp . Action function argument:  WP  object ($wp) by reference.",
      },
      {
        label = "pre_get_posts",
        documentation = "Runs before a query is executed in  the main query  or any instance of  WP_Query , such as  query_posts() ,  get_posts() , or  get_children() . This hook is called after the query variable object is created, but before the query is actually run, and can be used to to alter the primary query before it is run. Also see  is_main_query() . Action function arguments:  WP_Query  object by reference.",
      },
      {
        label = "sanitize_comment_cookies",
        documentation = "Runs after cookies have been read from the HTTP request.",
      },
      {
        label = "send_headers",
        documentation = "Runs after the basic HTTP headers are sent inside the main WordPress function  wp() . Action function argument:  WP  object ($wp) by reference.",
      },
      { label = "shutdown", documentation = "Runs when the page output is complete." },
      { label = "update_{$meta_type}_meta", documentation = "Runs when a metadata gets saved." },
      { label = "updated_{$meta_type}_meta", documentation = "Runs when a metadata has been updated." },
      {
        label = "upgrader_process_complete",
        documentation = "Runs when the plugin downloader/upgrader class finishes running",
      },
      {
        label = "wp_loaded",
        documentation = "This hook is fired once WP, all plugins, and the theme are fully loaded and instantiated.",
      },
      {
        label = "wp",
        documentation = "Executes after the query has been parsed and post(s) loaded, but before any template execution, inside the main WordPress function  wp() . Useful if you need to have access to post data but can’t use templates for output. Action function argument:  WP  object ( $wp ) by reference.",
      },
      { label = "login_init", documentation = "Fires when the login form is initialized." },
      { label = "login_form_{$action}", documentation = "Fires before a specified login form action." },
      { label = "login_enqueue_scripts", documentation = "Enqueue scripts and styles for the login page." },
      { label = "login_head", documentation = "Fires in the login page header after scripts are enqueued." },
      { label = "login_header", documentation = "Fires in the login page header after the body tag is opened." },
      { label = "login_form", documentation = "Fires following the ‘Password’ field in the login form." },
      {
        label = "lostpassword_post",
        documentation = "Fires before errors are returned from a password reset request.",
      },
      { label = "admin_email_confirm", documentation = "Fires before the admin email confirm form." },
      {
        label = "admin_email_confirm_form",
        documentation = "Fires inside the admin-email-confirm-form form tags, before the hidden fields.",
      },
      { label = "lost_password", documentation = "Fires before the lost password form." },
      {
        label = "lostpassword_form",
        documentation = "Fires inside the lostpassword form tags, before the hidden fields.",
      },
      { label = "validate_password_reset", documentation = "Fires before the password reset procedure is validated." },
      {
        label = "resetpass_form",
        documentation = "Fires following the ‘Strength indicator’ meter in the user password reset form.",
      },
      {
        label = "register_form",
        documentation = "Fires following the ‘Email’ field in the user registration form.",
      },
      {
        label = "user_request_action_confirmed",
        documentation = "Fires an action hook when the account action has been confirmed by the user.",
      },
      { label = "login_footer", documentation = "Fires in the login page footer." },
    },
  })
end

function M:new()
  return setmetatable({}, { __index = M })
end

return M
