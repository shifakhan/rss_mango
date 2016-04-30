module FeedsHelper
  def form_submit_text
    @feed.new_record? ? 'Add feed' : 'Update feed'
  end
end
