User.delete_all
Account.delete_all
Chore.delete_all
Family.delete_all
Transaction.delete_all

f1 = Family.create(:name => "Leonhardt LaTorre")
f2 = Family.create(:name => "Smith")

u1 = User.create( :last_name => "LaTorre", :first_name => "Tim", :email => "timlatorre@yahoo.com", :text_number => "646-331-4507", :is_parent => "t", :password => "123", :password_confirmation => "123" )
u2 = User.create( :last_name => "Leonhardt", :first_name => "Julie", :email => "julie.leonhardt@gmail.com", :text_number => "917-208-9105", :is_parent => "t", :password => "123", :password_confirmation => "123" )
u3 = User.create( :last_name => "Leonhardt-Garcia", :first_name => "Che", :email => "che.leon924@gmail.com", :text_number => "201-220-0635", :is_parent => "f", :password => "123", :password_confirmation => "123" )
u4 = User.create( :last_name => "Smith", :first_name => "Bill", :email => "bill@smith.com", :text_number => "212-555-0001", :is_parent => "t", :password => "123", :password_confirmation => "123" )
u5 = User.create( :last_name => "Smith", :first_name => "Mary", :email => "mary@smith.com", :text_number => "212-555-0002", :is_parent => "t", :password => "123", :password_confirmation => "123" )
u6 = User.create( :last_name => "Smith", :first_name => "Jill", :email => "jill@smith.com", :text_number => "212-555-0003", :is_parent => "f", :password => "123", :password_confirmation => "123" )
u7 = User.create( :last_name => "Smith", :first_name => "Jeff", :email => "jeff@smith.com", :text_number => "212-555-0004", :is_parent => "f", :password => "123", :password_confirmation => "123" )

f1.members = [u1, u2, u3]
f2.members = [u4, u5, u6, u7]

c1 = Chore.create( :name => "Walk the Dog", :description => "The dog needs walking", :is_allowance => "t", :amount => "" )
c2 = Chore.create( :name => "Take out the trash", :description => "", :is_allowance => "t", :amount => "" )
c3 = Chore.create( :name => "Take out recycling", :description => "both paper and plastic/glass", :is_allowance => "t", :amount => "" )
c4 = Chore.create( :name => "Clean bathroom", :description => "both paper and plastic/glass", :is_allowance => "t", :amount => "" )
c5 = Chore.create( :name => "Vacuum rug", :description => "living room and bedrooms", :is_allowance => "t", :amount => "" )
c6 = Chore.create( :name => "Mow the lawn", :description => "front and back", :is_allowance => "f", :amount => "10" )
c7 = Chore.create( :name => "Wash the car", :description => "inside and out", :is_allowance => "f", :amount => "12" )

u7.chores = [c1, c2, c3, c6]
u6.chores = [c4, c5, c7]

u4.chores_assigned = [c1, c2, c4, c7]
u5.chores_assigned = [c3, c5, c6]

f2.chores = [c1, c2, c3, c4, c5, c6, c7]

a1 = Account.create( :name => "Spending", :balance => 100 )
a2 = Account.create( :name => "Savings", :balance => 455 )
a3 = Account.create( :name => "Charitable", :balance => 65 )
a4 = Account.create( :name => "Spending", :balance => 39 )
a5 = Account.create( :name => "Savings", :balance => 699 )
a6 = Account.create( :name => "Charitable", :balance => 20 )

f2.accounts = [a1, a2, a3, a4, a5, a6]
u7.accounts = [a4, a5, a6]
u6.accounts = [a1, a2, a3]

t1 = Transaction.create( :description => "starting balance", :is_credit => "t", :strt_balance => 0, :amt_change => 100, :end_balance => 100, :created_at => "2012-12-01 12:00:00" )
t2 = Transaction.create( :description => "cash withdrawal", :is_credit => "f", :strt_balance => 100, :amt_change => 50, :end_balance => 50, :created_at => "2012-12-02 12:00:00" )
t3 = Transaction.create( :description => "chore payment", :is_credit => "t", :strt_balance => 50, :amt_change => 10, :end_balance => 60, :created_at => "2012-12-03 12:00:00" )
t4 = Transaction.create( :description => "chore payment", :is_credit => "t", :strt_balance => 60, :amt_change => 9, :end_balance => 69, :created_at => "2012-12-05 12:00:00" )
t5 = Transaction.create( :description => "chore payment", :is_credit => "t", :strt_balance => 69, :amt_change => 5, :end_balance => 74, :created_at => "2012-12-07 12:00:00" )
t6 = Transaction.create( :description => "cash withdrawal", :is_credit => "f", :strt_balance => 74, :amt_change => 20, :end_balance => 54, :created_at => "2012-12-08 12:00:00" )
t7 = Transaction.create( :description => "cash withdrawal", :is_credit => "f", :strt_balance => 54, :amt_change => 10, :end_balance => 44, :created_at => "2012-12-09 12:00:00" )
t8 = Transaction.create( :description => "chore payment", :is_credit => "t", :strt_balance => 44, :amt_change => 5, :end_balance => 49, :created_at => "2012-12-09 12:01:00" )
t9 = Transaction.create( :description => "cash withdrawal", :is_credit => "f", :strt_balance => 49, :amt_change => 20, :end_balance => 29, :created_at => "2012-12-11 12:00:00" )
t10 = Transaction.create( :description => "chore: washing the dog", :is_credit => "t", :strt_balance => 29, :amt_change => 10, :end_balance => 39, :created_at => "2012-12-12 12:00:00" )

f2.transactions = [t1, t2, t3, t4, t5, t6, t7, t8, t9, t10]
u4.transactions_created = [t1, t2, t3, t4, t5, t6, t7, t8, t9, t10]
a4.transactions = [t1, t2, t3, t4, t5, t6, t7, t8, t9, t10]




