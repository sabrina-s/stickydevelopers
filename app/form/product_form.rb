# Form object to refactor new product form
class ProductForm
  include ActiveModel::Model

  attr_reader :product

  delegate :attributes=, to: :product, prefix: true

  validate :product_is_valid?

  # attr_accessor :name, :description, :slug, :photo

  def initialize(params = {})
    if params[:slug].nil?
      @product = Product.new
    else
      @product = Product.find_by(slug: params[:slug])
      @params = params
    end

    super(params.except(:slug))
    # What super does -v
    # @product.name = params[:name]
    # @product.description = params[:description]
    # @product.slug = params[:slug]
    # @product.photo = params[:photo]
  end

  def save
    if valid?
      @product.save
    else
      false
    end
    # Additional methods goes here
    # send_mailer
    # change_status
  end

  def update
    if valid?
      @product.update(@params[:product_attributes])
    else
      false
    end
  end

  def product_is_valid?
    errors.add(:base, 'invalid product!') unless product.valid?
  end

  # def self.model_name
  #   ActiveModel::Name.new(self, nil, 'New Product')
  # end
end
