module VotesHelper
  def vote_link(text, url, voted)
    if voted
      link_to text, url, class: 'btn disabled', remote: true, method: :delete
    else
      link_to text, url, class: 'btn', remote: true
    end
  end
end