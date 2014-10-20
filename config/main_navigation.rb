SimpleNavigation::Configuration.run do |navigation|


  navigation.items do |primary|

    primary.item :home, 'HOME', '/home'
    primary.item :how, 'HOW IT WORKS', '/how-it-works'
    primary.item :testimonials, 'TESTIMONIALS', '/testimonials'
    primary.item :faq, 'FAQ', '/faq'
    primary.item :about, 'ABOUT US', '/about-us'
    primary.item :contact, 'CONTACT US', '/contact-us'
    primary.item :blogs, 'BLOG', '/blogs'


    primary.dom_class = 'nav navbar-nav'
    primary.dom_id = 'main-nav'

  end

end