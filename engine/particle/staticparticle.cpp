//     ____                _       __               
//    / __ )____  _____   | |     / /___ ___________
//   / __  / __ \/ ___/   | | /| / / __ `/ ___/ ___/
//  / /_/ / /_/ (__  )    | |/ |/ / /_/ / /  (__  ) 
// /_____/\____/____/     |__/|__/\__,_/_/  /____/  
//                                              
//       A futuristic real-time strategy game.
//          This file is part of Bos Wars.
//
/**@name staticparticle.cpp - The static particle. */
//
//      (c) Copyright 2007-2008 by Jimmy Salmon and Francois Beerten
//
//      This program is free software; you can redistribute it and/or modify
//      it under the terms of the GNU General Public License as published by
//      the Free Software Foundation; only version 2 of the License.
//
//      This program is distributed in the hope that it will be useful,
//      but WITHOUT ANY WARRANTY; without even the implied warranty of
//      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//      GNU General Public License for more details.
//
//      You should have received a copy of the GNU General Public License
//      along with this program; if not, write to the Free Software
//      Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
//      02111-1307, USA.
//

//@{

#include <stdio.h>
#include "stratagus.h"
#include "particle.h"


StaticParticle::StaticParticle(CPosition position, Animation *animation) :
	CParticle(position)
{
	Assert(animation);
	this->animation = animation->clone();
}

StaticParticle::~StaticParticle()
{
	delete animation;
}

void StaticParticle::draw()
{
	CPosition screenPos = ParticleManager.getScreenPos(pos);
	animation->draw(static_cast<int>(screenPos.x), static_cast<int>(screenPos.y));
}

void StaticParticle::update(int ticks)
{
	animation->update(ticks);
	if (animation->isFinished()) {
		destroy();
	}
}

CParticle* StaticParticle::clone()
{
	CParticle * p = new StaticParticle(pos, animation);
	return p;
}

//@}
