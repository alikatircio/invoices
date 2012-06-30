class Invoice < ActiveRecord::Base

  belongs_to :user

  attr_accessible :amount, :date, :io, :photo, :serial, :vat

  validates :amount, :date, :io, :serial, :vat, :photo_file_name, :presence => true
  validates_numericality_of :amount,  :greater_than => 0, :less_than => 100000000
  validates_numericality_of :vat, :greater_than => 0, :less_than => 100
  validates :serial, :uniqueness => true
  has_attached_file :photo, :styles => { :small => "150x150>"}
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/png']
  before_save :calculate

  def calculate
    self.total_amount = self.amount + (self.amount*(self.vat/100.0))
  end
  def self.search(q)
    if q.blank?
      where('1=1')
    else
      query = "%#{q}%"
      where("invoices.serial LIKE :query", query: query )
    end
  end
end
