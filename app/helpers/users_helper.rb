module UsersHelper

  def paginate(number) 
   
   html = content_tag(:ul, :class => "pagination") do
    (number - 2).upto(number+2) do |n|
      content_tag(:li) do
        content_tag(:a, :href => "page?page=#{n}")
      end
    end.to_s
  end
  html
end

  #   "<ul class='pagination'>
  #     <li><a href='/page?page=#{number - 1 }'>Prev</a></li>
  #     <li><a href=\"/page?page=#{number - 2 }>#{number - 2}</a></li>
  #     <li><a href=\"/page?page=#{number - 1 }>#{number - 1}</a></li>
  #     <li class='active'><a href=\"/page?page=#{number}>#{number}</a></li>
  #     <li><a href=\"/page?page=#{number + 1}>#{number + 1}</a></li>
  #     <li><a href=\"/page?page=#{number + 2}>#{number + 2}</a></li>
  #   </ul>"
  # end
end


# def display_all(collection)
#   content_tag(:ul, :class => "list") do
#     collection.collect do |member|
#       content_tag(:li, :id => member.name.gsub(' ', '-').downcase.strip) do
#         member.name
#       end
#     end
#   end
# end
