require('util')


function prt_behit( ... )
	-- body
	print("table length: "..#g_BeHit, util.table_len(g_BeHit))
	print(g_BeHit[0]['presentid'], g_BeHit[0]['hitid'], g_BeHit[0]['death'], g_BeHit[0]['hit_back'][0], g_BeHit[0]['hit_back'][1])
	print(g_BeHit[1]["presentid"], g_BeHit[1]['hitid'], g_BeHit[1]['death'], #(g_BeHit[1]['hit_back']))
	print(g_BeHit[17]["presentid"], g_BeHit[17]['hitid'], g_BeHit[17]['death'], #(g_BeHit[17]['hit_back']))
end


print("read table behit from lua")