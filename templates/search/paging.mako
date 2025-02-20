
<div class="paging">

    % if int(c['io'].start()) >= c['io'].page_size():
    <form method="get" action="">
          % for item in c['io'].get_safe_terms_object():
          <input type="hidden" name="${item}" value='${c['io'].get_safe_terms_object()[item]}' />
          % endfor
          <input type="hidden" name="q" value="${c['io'].get_q()}" />
    <input type="hidden" name="from" value="${int(c['io'].start()) - c['io'].page_size()}" />
    <input type="hidden" name="size" value="${c['io'].page_size()}" />
    <input type="hidden" name="sort" value="${c['io'].sorted_by()}" />
    <input type="hidden" name="order" value="${c['io'].sort_order()}" />
    <input type="submit" class="paging_submit_left" name="submit" value="previous" />
    </form>
    % endif

    <form method="get" action="">
          % for item in c['io'].get_safe_terms_object():
          <input type="hidden" name="${item}" value='${c['io'].get_safe_terms_object()[item]}' />
          % endfor
          <input type="hidden" name="q" value="${c['io'].get_q()}" />
    <select class="small" name="from" id="page_select">

% for i in range(0, ( c['io'].numFound() / c['io'].page_size() ) + 1):
    % if (i * c['io'].page_size()) == int(c['io'].start()):
    <option value="${i * c['io'].page_size()}" selected>
    % else:
    <option value="${i * c['io'].page_size()}">
    % endif
    ${i * c['io'].page_size() + 1} - 
    % if i * c['io'].page_size() + 1 + c['io'].page_size() < c['io'].numFound():
        ${i * c['io'].page_size() + c['io'].page_size()}
    % else:
        ${c['io'].numFound()}
    % endif
    </option>
% endfor
    
    </select>

    <span class="io_total">of ${c['io'].numFound()} results. </span><span>Show </span>

    <select class="small" name="size" id="rpp_select">
    % for rpp in c['io'].get_rpp_options():
    %   if rpp == int(c['io'].page_size()):
        <option selected>${rpp}</option>
    %   else:
        <option value="${rpp}">${rpp}</option>
    %   endif
    % endfor
    </select>

     Sort
    <select class="small" name="sort" id="sort_select">
        <option>...</option>
    % for sort in c['io'].get_sort_fields():
    %   if sort == c['io'].sorted_by():
        <option selected>${sort}</option>
    %   else:
        <option value="${sort}">${sort}</option>
    %   endif
    % endfor
    </select>

     desc: 

    % if c['io'].sort_order() == "desc":
    <input id="order_select" type="checkbox" name="order" value="desc" checked />
    % else:
    <input id="order_select" type="checkbox" name="order" value="desc" />
    % endif
    
    <input type="submit" name="submit" value="update" id="paging_trigger" />
    </form>

    % if ( int(c['io'].start()) + int(c['io'].page_size()) ) < c['io'].numFound():
    <form method="get" action="">
          % for item in c['io'].get_safe_terms_object():
          <input type="hidden" name="${item}" value='${c['io'].get_safe_terms_object()[item]}' />
          % endfor
          <input type="hidden" name="q" value="${c['io'].get_q()}" />
    <input type="hidden" name="from" value="${int(c['io'].start()) + int(c['io'].page_size())}" />
    <input type="hidden" name="size" value="${int(c['io'].page_size())}" />
    <input type="hidden" name="sort" value="${c['io'].sorted_by()}" />
    <input type="hidden" name="order" value="${c['io'].sort_order()}" />
    <input type="submit" class="paging_submit_right" name="submit" value="next" />
    </form>
    % endif

</div>

<div class="spacer"></div>        

