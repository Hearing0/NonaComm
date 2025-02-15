class Cube(q, r, s):
	var q: int
	var r: int
	var s: int

func cube_to_axial(cube):
	var q = cube.q
	var r = cube.r
	return Hex(q, r)

func cube_round(frac):
	var q = round(frac.q)
	var r = round(frac.r)
	var s = round(frac.s)

	var q_diff = abs(q - frac.q)
	var r_diff = abs(r - frac.r)
	var s_diff = abs(s - frac.s)

	if q_diff > r_diff and q_diff > s_diff:
		q = -r-s
	elif r_diff > s_diff:
		r = -q-s
	else:
		s = -q-r
	
	return Cube(q, r, s)

func axial_round(hex):
	return cube_to_axial(cube_round(axial_to_cube(hex)))

func pixel_to_flat_hex(point):
	var q = ( 2./3 * point.x                        ) / tile_size
	var r = (-1./3 * point.x  +  sqrt(3)/3 * point.y) / tile_size
	return axial_round(Hex(q, r))
