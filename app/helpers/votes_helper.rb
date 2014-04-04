module VotesHelper
  def vote_link(text, url, voted)
    options = { class: [:btn], remote: true }
    if voted
      options[:class] << :disabled
      options[:method] = :delete
    end
    link_to text, url, options
  end
end