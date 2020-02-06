module dyn();
int arr[ ], arr1[ ];
initial begin 
arr = new[5];
foreach (arr[j])
arr[j] = j;
arr1 = arr;
arr1[0] = 5;
$display(arr[0], arr1[0]);
arr = new[20](arr);
arr = new[100];
arr.delete;
end
int j = 1,
b[$] = {3,4},
q[$] = {0,2,5};
initial begin
q.insert(1, j);
q.insert(3, b);
q.delete(1);
q.push_front(6);
j = q.pop_back;
q.push_back(8);
j = q.pop_front;
foreach (q[i])
$display(q[i]);
end
endmodule