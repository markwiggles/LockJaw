SimpleNavigation::Configuration.run do |navigation|


  navigation.items do |primary|

    primary.item :admin, 'HOME', '/admin_homes' do |home|
      home.item :admin_home, 'Helpers', admin_homes_path
      home.item :admin_buymsg, 'Buy Message', admin_buymsgs_path
      home.item :admin_buyposter, 'Promo Poster', admin_buyposters_path
      home.item :admin_social_media, 'Social Media', admin_social_medias_path
    end

    primary.item :admin_tabs, 'HOW IT WORKS', '/admin_hows'
    primary.item :admin_testimonials, 'TESTIMONIALS', '/admin_testimonials'
    primary.item :admin_faq, 'FAQ', '/admin_faqs'
    primary.item :admin_about, 'ABOUT US', '/admin_abouts'
    primary.item :admin_contact, 'CONTACT US', '/admin_contacts' do |contact|
      contact.item :page_update, 'Page Updates','/admin_contacts'
      contact.item :admin_email, 'Email Settings', admin_emails_path
    end

    primary.item :admin_tabs, 'BLOG', '/admin_tabs'


    primary.dom_class = 'nav navbar-nav'
    primary.dom_id = 'admin-nav'

  end

end