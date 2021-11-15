class Background
  attr_reader :id, :image

  def initialize(data)
    @id = nil
    @image = format_image(data)
  end

  private

  def format_image(data)
    {
      location: "#{data[:results][0][:tags][0][:title]},#{data[:results][0][:tags][1][:title]}",
      image_url: data[:results][0][:urls][:full],
      credit: {
        author: data[:results][0][:user][:username],
        link: data[:results][0][:user][:portfolio_url]
      }
    }
  end
end