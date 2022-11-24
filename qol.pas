program qol;
type
    node_ptr = ^node;
    node = record
        data: longint;
        next: node_ptr;
    end;
    queue_of_longint = record
        first, last: node_ptr;
    end;

procedure qol_init(var queue: queue_of_longint);
begin
    queue.first := nil;
    queue.last := nil
end;

procedure qol_put(var queue: queue_of_longint; value: longint);
begin
    if queue.first = nil then
    begin
        new(queue.first);
        queue.last := queue.first
    end
    else
    begin
        new(queue.last^.next);
        queue.last := queue.last^.next
    end;
    queue.last^.data := value;
    queue.last^.next := nil
end;

procedure qol_get(var queue: queue_of_longint; var value: longint);
var
    tmp: node_ptr;
begin
    value := queue.first^.data;
    tmp := queue.first;
    queue.first := queue.first^.next;
    if queue.first = nil then
        queue.last := nil;
    dispose(tmp)
end;

function qol_is_empty(var queue: queue_of_longint): boolean;
begin
    qol_is_empty := queue.first = nil
end;

var
    queue: queue_of_longint;
    in_data: longint;
begin
    while not SeekEof do
    begin
        readln(in_data);
        qol_put(queue, in_data)
    end;
    writeln();
    while not qol_is_empty(queue) do
    begin
        qol_get(queue, in_data);
        writeln(in_data)
    end
end.
