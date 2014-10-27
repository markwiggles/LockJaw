

eway_code = '<!-- Begin eWAY Linking Code -->
<div id="eWAYBlock" class="pull-right" style="margin-top: 20px;">
    <div style="text-align:center;">

            <img alt="eWAY Payment Gateway" src="https://www.eway.com.au/developer/payment-code/verified-seal.ashx?img=10&size=7&pid=e640c375-cb66-49aa-b5ba-d966fce24d33" />
        </a>
    </div>
<div id="credit-cards" style="margin-top: 10px;">
  <%= image_tag "mastercard.png" %>
  <%= image_tag "visa.png" %>
  <%= image_tag "amex.png" %>
  <%= image_tag "paypal.png" %>
</div>
</div>
<!-- End eWAY Linking Code -->

'


Deface::Override.new({:virtual_path => 'spree/products/show',

                      :name => 'add_eway_seal',
                      :insert_after => '#cart-form',
                      :text => eway_code

                     })