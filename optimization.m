function [ Vertex_updated ] = SNS_optimization(Vertex_set_org, Vertex_warped_initial, importance_quad)

[Vertex_updated] = ...
    SNS_Opt_Iter_M(Vertex_set_org ,Vertex_warped_initial, importance_quad);

Vertex_updated_old = Vertex_updated;

Vertex_max_move = inf;
Iter_NUM = 1;
while(Vertex_max_move > 0.5)
    Iter_NUM = Iter_NUM + 1;
    disp(['########## Iteration no. ' num2str(Iter_NUM)]);
    [Vertex_updated] = ...
        SNS_Opt_Iter_M(Vertex_set_org ,Vertex_updated, importance_quad);
    Vertex_max_move = max(max(max(abs(Vertex_updated_old - Vertex_updated))));
    Vertex_updated_old = Vertex_updated;
    disp(['--- Max movement =  ' num2str(Vertex_max_move, '%.3f')]);
end

end

