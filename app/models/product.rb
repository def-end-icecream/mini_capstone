class Product < ApplicationRecord

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  has_many :images

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  # validates :description, length: { in: 10..500 }
  # validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "incorrect file format (must be .png, .jpg, or .jpeg)", multiline: true

  scope :title_search, ->(search_terms) { where("name ILIKE ?", "%#{search_terms}%") if search_terms }

  scope :discounted, ->(check_discount) { where("price < ?", 10) if check_discount }

  scope :sorted, ->(sort, sort_order) {
    if sort == "price" && sort_order == "asc"
      order(price: :asc)
    elsif sort == "price" && sort_order == "desc"
      order(price: :desc)
    else
      order(id: :asc)
    end
  }

  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end