is_older((1992,2,3),(1993,5,6));
is_older((1994,2,3),(1993,5,6));
is_older((1994,2,3),(1994,5,6));
is_older((1994,2,3),(1994,2,6));
is_older((1994,2,7),(1994,2,6));
is_older((1994,2,7),(1994,2,7));


number_in_month([(1994,2,7),(1994,3,7)],2);

number_in_months([(1982,3,4),(1983,4,4),(1823,5,6)],[3,4]);
number_in_months([(1982,3,4),(1983,4,4),(1823,5,6)],[3,4,5]);
number_in_months([(1982,3,4),(1983,4,4),(1823,5,6)],[5,6]);
number_in_months([(1982,3,4),(1983,4,4),(1823,5,6)],[1]);
number_in_months([(1982,3,4),(1983,4,4),(1823,5,6)],[]);
number_in_months([(1982,3,4),(1983,5,6),(1983,5,6)],[]);
number_in_months([(1982,3,4),(1983,5,6),(1983,5,6)],[5]);
number_in_months([(1982,3,4),(1983,5,6),(1983,5,6)],[3,5]);



dates_in_month([(1982,3,4),(1983,4,4),(1823,5,6)],4);
dates_in_month([(1982,3,4),(1983,5,6),(1983,5,6)],3);
dates_in_month([(1982,3,4),(1983,5,6),(1983,5,6)],5);
dates_in_month([(1982,3,4),(1983,5,6),(1983,5,6)],6);


dates_in_months([(1982,3,4),(1983,4,4),(1823,5,6)],[3,4,5]);
dates_in_months([(1982,3,4),(1983,4,4),(1823,5,6)],[5,6]);
dates_in_months([(1982,3,4),(1983,4,4),(1823,5,6)],[1]);
dates_in_months([(1982,3,4),(1983,4,4),(1823,5,6)],[]);
dates_in_months([(1982,3,4),(1983,5,6),(1983,5,7)],[5]);
dates_in_months([(1982,3,4),(1983,5,6),(1983,5,6)],[5]);
dates_in_months([(1982,3,4),(1983,5,6),(1983,5,6)],[3,5]);

number_before_reaching_sum(7,[3,3,3,4,5]);
number_before_reaching_sum(7,[1,2,3,4,5]);
number_before_reaching_sum(5,[1,2,3,4,5]);
number_before_reaching_sum(6,[1,2,3,4,5]);
number_before_reaching_sum(6,[1,2,2,4,5]);
number_before_reaching_sum(7,[3,3,3,4,5]);

what_month(31);
what_month(32);
what_month(1);
what_month(365);


month_range(35,34);
month_range(35,34);
month_range(34,34);
month_range(33,34);
month_range(31,31);
month_range(31,32);
month_range(1,365);


oldest([(1982,2,22),(1990,4,4)]);
oldest([(1982,2,22),(1990,4,4),(1983,1,1)]);
oldest([(1992,2,22),(1990,4,4),(1983,1,1)]);
oldest([(1992,2,22),(1990,4,4),(1993,1,1)]);
oldest([]);
