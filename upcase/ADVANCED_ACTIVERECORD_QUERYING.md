# Advanced ActiveRecord Querying

## belongs_to

```ruby
class Location < ActiveRecord::Base
  belongs_to :region

  def self.in_region(region)
    joins(:region).where(regions: { name: region })
  end
end

class Person < ActiveRecord::Base
  belongs_to :location

  def self.in_region(region)
    joins(:location).merge(Location.in_region(region))
    joins(location: :region).where("regions.name = ?", region)
  end

  def self.alphabetically_by_region_and_location
    joins(location: :region).order("regions.name, locations.name, name")
  end
end
```

## has_many

```ruby
class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many :employees, class_name: "Person", foreign_key: :manager_id

  def self.order_by_location_name
    joins(:location).order('locations.name')
  end

  def self.with_employees
    joins(:employees).distinct
  end

  def self.with_employees_order_by_location_name
    from(Person.with_employees, :people).order_by_location_name
  end
end
```
