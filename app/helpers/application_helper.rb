module ApplicationHelper
  # ページごとにタイトルを変更
  def full_title(page_title = "")
    base_title = "COACHTECHフリマアプリ"
    if !page_title
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end
end
