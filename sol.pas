program sol;
type
    node_ptr = ^node;
    node = record
        data: longint;
        next: node_ptr;
    end;

procedure sol_push(var stack: node_ptr; value: longint);
var
    temp: node_ptr;
begin
    new(temp);
    temp^.data := value;
    temp^.next := stack;
    stack := temp
end;

procedure sol_pop(var stack: node_ptr; var value: longint);
var
    temp: node_ptr;
begin
    value := stack^.data;
    temp := stack;
    stack := stack^.next;
    dispose(temp)
end;

procedure sol_init(var stack: node_ptr);
begin
    stack := nil
end;

function sol_is_empty(var stack: node_ptr): boolean;
begin
    sol_is_empty := stack = nil
end;

var
    stack: node_ptr;
    in_data: longint;
begin
    sol_init(stack);
    while not SeekEof do
    begin
        readln(in_data);
        sol_push(stack, in_data)
    end;
    writeln();
    while not sol_is_empty(stack) do
    begin
        sol_pop(stack, in_data);
        writeln(in_data)
    end
end.
