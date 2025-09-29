-- This filter inserts an <hr> (Horizontal Rule) after every block with class 'question'

function Div(el)
  if el.classes:includes("question") then
    local hr = pandoc.RawBlock("html", '<hr class="question-hr" />')
    return {el, hr}
  end
  return nil
end

