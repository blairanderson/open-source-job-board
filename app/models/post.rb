class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates_formatting_of :company_url, using: :url
  validates_formatting_of :contact_email, using: :email
  acts_as_votable

  def self.enum_form_options(data)
    data.map{|record| [record.titleize, record]}
  end

  def to_param
    "#{id.to_s.rjust(10, '0')} #{title}".parameterize
  end

  enum status: [:draft, :published, :archived]
  enum job_type: [:full_time, :part_time, :freelance, :temporary]
  enum how_to_apply: [:apply_by_url, :apply_by_email]

  def self.job_type_form_options
    self.enum_form_options(self.job_types.keys)
  end

  def self.how_to_apply_form_options
    self.enum_form_options(self.how_to_applies.keys)
  end

  def self.cached
    self.order(:created_at).select(:id,:title)
  end

  def posted
    created_at.strftime('%b %e')
  end

  def path
    Rails.application.routes.url_helpers.post_url(self)
  end
end
