Deface::Override.new({:virtual_path => 'spree/shared/_header',

                      :name => 'remove_logo',
                      :replace => '#logo',
                      :text => '<figure id="logo" class="col-md-4" data-hook>
<img alt="ladderclampz" class="img-responsive" height="100" id="logo" src="/assets/ladderclampz_logo.png" width="200">
</figure>'
                     })
