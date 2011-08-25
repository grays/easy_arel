require 'bundler/setup'
require 'test/unit'
require 'active_support/core_ext'
require 'active_support/test_case'
require 'active_record'
require 'active_record/migration'
require 'easy_arel'

ActiveRecord::Base.configurations = {
  'test' => { adapter: 'sqlite3', database: ":memory:" }
}

ActiveRecord::Base.establish_connection('test')

class CreateThings < ActiveRecord::Migration

  def self.up
    create_table :things, force: true do |t|
      t.timestamps
    end
  end
end

CreateThings.migrate(:up)

class Thing < ActiveRecord::Base

  scope :recent, order(_[:created_at].desc)
end

class EasyArelTest < ActiveSupport::TestCase

  test 'sanity' do
    assert_kind_of Module, EasyArel
  end

  test 'arel_table is aliased' do
    assert_equal Thing.arel_table[:created_at], Thing[:created_at]
  end

  test 'silly underscore is self' do
    assert_equal Thing, Thing._
  end

  test 'silly underscore is for instances too' do
    assert_equal Thing, Thing.new._
  end

  test 'can be used to do sexy stuff' do
    sql = Thing.order(Thing.arel_table[:created_at].desc).to_sql
    assert_equal sql, Thing.recent.to_sql
  end
end
