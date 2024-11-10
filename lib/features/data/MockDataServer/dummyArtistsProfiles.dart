// ignore_for_file: file_names

//This class implements a local data base. In our case we have build 8 sample profiles.

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:flutter/material.dart';

class dummyArtistsProfiles {

  static List<ArtistProfile> dummyProfileList = [
    profile1,
    profile2,
    profile3,
    profile4,
    profile5,
    profile6,
    profile7,
    profile8,
  ];

  static ArtistProfile profile1 = ArtistProfile(
    id: 0,
    dummyProfileName: 'FlowerArt',
    dummyProfilePhoto: AssetImage('assets/images/photo1.jpg'), 
    dummyGenre: 'flowers',
    followers: 384,
    dummyProfilePosts: [
      Posts(
        PhotoOfPost: AssetImage('assets/images/photo1.jpg'),
        likesOfPost: 43,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
        ),
        ],
        id: 0,
        artistProfileName: 'FlowerArt',
        artistsProfilePhoto: AssetImage('assets/images/photo1.jpg'), 
        postsIndex: 0,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof1.jpg'),
        likesOfPost: 263,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
        ),
        ],
        id: 0,
        artistProfileName: 'FlowerArt',
        artistsProfilePhoto: AssetImage('assets/images/photo1.jpg'), 
        postsIndex: 1,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof11.jpg'),
        likesOfPost: 433,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
        ),
        ],
        id: 0,
        artistProfileName: 'FlowerArt',
        artistsProfilePhoto: AssetImage('assets/images/photo1.jpg'), 
        postsIndex: 2,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof13.jpg'),
        likesOfPost: 23,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
        ),
        ],
        id: 0,
        artistProfileName: 'FlowerArt',
        artistsProfilePhoto: AssetImage('assets/images/photo1.jpg'), 
        postsIndex: 3,
      ),
    ],
    dummyReviews: [
      UserComment(
          comment: 'Great work!!', 
          userWhoCommented: 'user2783',
        ),
      UserComment(
          comment: 'Fantastic job! I recomend', 
          userWhoCommented: 'user2113',
        )
    ]
  ); 

  static ArtistProfile profile2 = ArtistProfile(
    id: 1,
    dummyProfileName: 'J.Dragon',
    dummyProfilePhoto: AssetImage('assets/images/photo2.jpg'), 
    dummyGenre: 'japanese',
    followers: 439,
    dummyReviews: [
      UserComment(
        comment: 'Great work!!', 
        userWhoCommented: 'user2783',
      )
    ],
    dummyProfilePosts: [
      Posts(
        PhotoOfPost: AssetImage('assets/images/photo2.jpg'),
        likesOfPost: 53,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user1934',
          )
        ],
        id: 1,
        artistProfileName: 'J.Dragon',
        artistsProfilePhoto: AssetImage('assets/images/photo2.jpg'), 
        postsIndex: 0,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof2.jpg'),
        likesOfPost: 62,
        commenstOfPost: [
          UserComment(
            comment: 'Fantastic job!!', 
            userWhoCommented: 'user7383',
          )
        ],
        id: 1,
        artistProfileName: 'J.Dragon',
        artistsProfilePhoto: AssetImage('assets/images/photo2.jpg'), 
        postsIndex: 1,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof21.jpg'),
        likesOfPost: 612,
        commenstOfPost: [
          UserComment(
            comment: 'Fantastic job!!', 
            userWhoCommented: 'user7383',
          )
        ],
        id: 1,
        artistProfileName: 'J.Dragon',
        artistsProfilePhoto: AssetImage('assets/images/photo2.jpg'), 
        postsIndex: 2,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof22.jpg'),
        likesOfPost: 92,
        commenstOfPost: [
          UserComment(
            comment: 'Fantastic job!!', 
            userWhoCommented: 'user7383',
          )
        ],
        id: 1,
        artistProfileName: 'J.Dragon',
        artistsProfilePhoto: AssetImage('assets/images/photo2.jpg'), 
        postsIndex: 3,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof23.jpg'),
        likesOfPost: 99,
        commenstOfPost: [
          UserComment(
            comment: 'Fantastic job!!', 
            userWhoCommented: 'user7383',
          )
        ],
        id: 1,
        artistProfileName: 'J.Dragon',
        artistsProfilePhoto: AssetImage('assets/images/photo2.jpg'), 
        postsIndex: 4,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof24.jpg'),
        likesOfPost: 42,
        commenstOfPost: [
          UserComment(
            comment: 'Fantastic job!!', 
            userWhoCommented: 'user7383',
          )
        ],
        id: 1,
        artistProfileName: 'J.Dragon',
        artistsProfilePhoto: AssetImage('assets/images/photo2.jpg'), 
        postsIndex: 5,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof25.jpeg'),
        likesOfPost: 22,
        commenstOfPost: [
          UserComment(
            comment: 'Fantastic job!!', 
            userWhoCommented: 'user7383',
          )
        ],
        id: 1,
        artistProfileName: 'J.Dragon',
        artistsProfilePhoto: AssetImage('assets/images/photo2.jpg'), 
        postsIndex: 6,
      ),
    ]
  );

  static ArtistProfile profile3 = ArtistProfile(
    id: 2,
    dummyProfileName: 'Levi.Ackerman',
    dummyProfilePhoto: AssetImage('assets/images/photo3.jpg'), 
    dummyGenre: 'anime',
    followers: 798,
    dummyReviews: [
      UserComment(
        comment: 'Great work!!', 
        userWhoCommented: 'user2783',
      )
    ],
    dummyProfilePosts: [
      Posts(
        PhotoOfPost: AssetImage('assets/images/photo3.jpg'),
        likesOfPost: 45,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user1723',
          )
        ],
        id: 2,
        artistProfileName: 'Levi.Acherman',
        artistsProfilePhoto: AssetImage('assets/images/photo3.jpg'), 
        postsIndex: 0,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof3.jpg'),
        likesOfPost: 87,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user3283',
          )
        ],
        id: 2,
        artistProfileName: 'Levi.Acherman',
        artistsProfilePhoto: AssetImage('assets/images/photo3.jpg'), 
        postsIndex: 1,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof31.png'),
        likesOfPost: 365,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 2,
        artistProfileName: 'Levi.Acherman',
        artistsProfilePhoto: AssetImage('assets/images/photo3.jpg'), 
        postsIndex: 2,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof32.jpg'),
        likesOfPost: 35,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 2,
        artistProfileName: 'Levi.Acherman',
        artistsProfilePhoto: AssetImage('assets/images/photo3.jpg'), 
        postsIndex: 3,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof33.jpeg'),
        likesOfPost: 65,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 2,
        artistProfileName: 'Levi.Acherman',
        artistsProfilePhoto: AssetImage('assets/images/photo3.jpg'), 
        postsIndex: 4,
      ),
    ]
  );

  static ArtistProfile profile4 = ArtistProfile(
    id: 3,
    dummyProfileName: 'Mikasa',
    dummyProfilePhoto: AssetImage('assets/images/photo4.jpg'), 
    dummyGenre: 'anime',
    followers: 762,
    dummyReviews: [
      UserComment(
        comment: 'Great result! Thank you so much.', 
        userWhoCommented: 'user2118',
      ),
      UserComment(
        comment: 'I recommend this shop', 
        userWhoCommented: 'user8128',
      ),
      UserComment(
        comment: 'Very professional!!', 
        userWhoCommented: 'user2133,',
      ),
      UserComment(
        comment: 'Affordable studio.', 
        userWhoCommented: 'user2118',
      ),
      UserComment(
        comment: 'Hands down the best tattoo artists I have met!', 
        userWhoCommented: 'user1122',
      )
    ],
    dummyProfilePosts: [
      Posts(
        PhotoOfPost: AssetImage('assets/images/photo4.jpg'),
        likesOfPost: 64,
        commenstOfPost: [
          UserComment(
            comment: 'Wow amazing!!', 
            userWhoCommented: 'user2222',
          ),
          UserComment(
            comment: 'Best tattoo artist in town', 
            userWhoCommented: 'user3232',
          ),
          UserComment(
            comment: 'This is fire!', 
            userWhoCommented: 'user2222',
          ),
        ],
        id: 3,
        artistProfileName: 'Mikasa',
        artistsProfilePhoto: AssetImage('assets/images/photo4.jpg'), 
        postsIndex: 0,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof4.jpg'),
        likesOfPost: 98,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 3,
        artistProfileName: 'Mikasa',
        artistsProfilePhoto: AssetImage('assets/images/photo4.jpg'), 
        postsIndex: 1,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof41.jpg'),
        likesOfPost: 36,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 3,
        artistProfileName: 'Mikasa',
        artistsProfilePhoto: AssetImage('assets/images/photo4.jpg'), 
        postsIndex: 2,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof42.jpg'),
        likesOfPost: 43,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 3,
        artistProfileName: 'Mikasa',
        artistsProfilePhoto: AssetImage('assets/images/photo4.jpg'), 
        postsIndex: 3,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof43.jpg'),
        likesOfPost: 43,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 3,
        artistProfileName: 'Mikasa',
        artistsProfilePhoto: AssetImage('assets/images/photo4.jpg'), 
        postsIndex: 4,
      ),
    ]
  );
  
  static ArtistProfile profile5 = ArtistProfile(
    id: 4,
    dummyProfileName: 'Kaneki.ken',
    dummyProfilePhoto: AssetImage('assets/images/photo5.jpg'), 
    dummyGenre: 'anime',
    followers: 1422,
    dummyReviews: [
      UserComment(
        comment: 'Great work!!', 
        userWhoCommented: 'user2783',
      )
    ],
    dummyProfilePosts: [
      Posts(
        PhotoOfPost: AssetImage('assets/images/photo5.jpg'),
        likesOfPost: 43,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 4,
        artistProfileName: 'Kaneki.ken',
        artistsProfilePhoto: AssetImage('assets/images/photo5.jpg'), 
        postsIndex: 0,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof5.jpg'),
        likesOfPost: 43,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 4,
        artistProfileName: 'Kaneki.ken',
        artistsProfilePhoto: AssetImage('assets/images/photo5.jpg'), 
        postsIndex: 1,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof51.jpg'),
        likesOfPost: 43,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 4,
        artistProfileName: 'Kaneki.ken',
        artistsProfilePhoto: AssetImage('assets/images/photo5.jpg'), 
        postsIndex: 2,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof52.png'),
        likesOfPost: 243,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 4,
        artistProfileName: 'Kaneki.ken',
        artistsProfilePhoto: AssetImage('assets/images/photo5.jpg'), 
        postsIndex: 3,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof53.jpg'),
        likesOfPost: 43,
        commenstOfPost: [
          UserComment(
            comment: 'Amazing work!!', 
            userWhoCommented: 'user2783',
          )
        ],
        id: 4,
        artistProfileName: 'Kaneki.ken',
        artistsProfilePhoto: AssetImage('assets/images/photo5.jpg'), 
        postsIndex: 4,
      ),
    ]
  );

  static ArtistProfile profile6 = ArtistProfile(
    id: 5,
    dummyProfileName: 'Maori__',
    dummyProfilePhoto: AssetImage('assets/images/photo6.jpg'), 
    dummyGenre: 'Maori/Tribal',
    followers: 84,
    dummyProfilePosts: [
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof6.png'),
        likesOfPost: 143,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 5,
        artistProfileName: 'Maori__',
        artistsProfilePhoto: AssetImage('assets/images/photo6.jpg'), 
        postsIndex: 0,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof61.jpg'),
        likesOfPost: 283,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 5,
        artistProfileName: 'Maori__',
        artistsProfilePhoto: AssetImage('assets/images/photo6.jpg'), 
        postsIndex: 1,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof62.jpg'),
        likesOfPost: 133,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 5,
        artistProfileName: 'Maori__',
        artistsProfilePhoto: AssetImage('assets/images/photo6.jpg'), 
        postsIndex: 2,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof63.jpg'),
        likesOfPost: 23,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 5,
        artistProfileName: 'Maori__',
        artistsProfilePhoto: AssetImage('assets/images/photo6.jpg'), 
        postsIndex: 3,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof64.jpg'),
        likesOfPost: 223,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 5,
        artistProfileName: 'Maori__',
        artistsProfilePhoto: AssetImage('assets/images/photo6.jpg'), 
        postsIndex: 4,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/photo6.jpg'),
        likesOfPost: 143,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 5,
        artistProfileName: 'Maori__',
        artistsProfilePhoto: AssetImage('assets/images/photo6.jpg'), 
        postsIndex: 5,
      ),
    ],
    dummyReviews: [
      UserComment(
        comment: 'Great work!!', 
        userWhoCommented: 'user2783',
      ),
      UserComment(
        comment: 'Fantastic job! I recomend', 
        userWhoCommented: 'user2113',
      )
    ]
  ); 

  static ArtistProfile profile7 = ArtistProfile(
    id: 6,
    dummyProfileName: 'Inkme',
    dummyProfilePhoto: AssetImage('assets/images/photo7.jpg'), 
    dummyGenre: 'Symetric/Geometric',
    followers: 184,
    dummyProfilePosts: [
      Posts(
        PhotoOfPost: AssetImage('assets/images/photo7.jpg'),
        likesOfPost: 143,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 6,
        artistProfileName: 'Inkme',
        artistsProfilePhoto: AssetImage('assets/images/photo7.jpg'), 
        postsIndex: 0,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof7.jpg'),
        likesOfPost: 193,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 6,
        artistProfileName: 'Inkme',
        artistsProfilePhoto: AssetImage('assets/images/photo7.jpg'), 
        postsIndex: 1,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof71.jpg'),
        likesOfPost: 343,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 6,
        artistProfileName: 'Inkme',
        artistsProfilePhoto: AssetImage('assets/images/photo7.jpg'), 
        postsIndex: 2,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof72.jpg'),
        likesOfPost: 313,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 6,
        artistProfileName: 'Inkme',
        artistsProfilePhoto: AssetImage('assets/images/photo7.jpg'), 
        postsIndex: 3,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof73.jpg'),
        likesOfPost: 34,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 6,
        artistProfileName: 'Inkme',
        artistsProfilePhoto: AssetImage('assets/images/photo7.jpg'), 
        postsIndex: 4,
      ),
    ],
    dummyReviews: [
      UserComment(
        comment: 'Great work!!', 
        userWhoCommented: 'user2783',
      ),
      UserComment(
        comment: 'Fantastic job! I recomend', 
        userWhoCommented: 'user2113',
      )
    ]
  );

  static ArtistProfile profile8 = ArtistProfile(
    id: 7,
    dummyProfileName: 'Tattuist',
    dummyProfilePhoto: AssetImage('assets/images/photo8.png'), 
    dummyGenre: 'Portrait/animal',
    followers: 1314,
    dummyProfilePosts: [
      Posts(
        PhotoOfPost: AssetImage('assets/images/photo8.png'),
        likesOfPost: 143,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 7,
        artistProfileName: 'Tattuist',
        artistsProfilePhoto: AssetImage('assets/images/photo8.png'), 
        postsIndex: 0,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof8.jpg'),
        likesOfPost: 213,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 7,
        artistProfileName: 'Tattuist',
        artistsProfilePhoto: AssetImage('assets/images/photo8.png'), 
        postsIndex: 1,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof9.jpg'),
        likesOfPost: 1213,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 7,
        artistProfileName: 'Tattuist',
        artistsProfilePhoto: AssetImage('assets/images/photo8.png'), 
        postsIndex: 2,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof81.jpg'),
        likesOfPost: 613,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 7,
        artistProfileName: 'Tattuist',
        artistsProfilePhoto: AssetImage('assets/images/photo8.png'), 
        postsIndex: 3,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof82.jpg'),
        likesOfPost: 827,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 7,
        artistProfileName: 'Tattuist',
        artistsProfilePhoto: AssetImage('assets/images/photo8.png'), 
        postsIndex: 4,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof92.jpg'),
        likesOfPost: 491,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 7,
        artistProfileName: 'Tattuist',
        artistsProfilePhoto: AssetImage('assets/images/photo8.png'), 
        postsIndex: 5,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof93.jpg'),
        likesOfPost: 542,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 7,
        artistProfileName: 'Tattuist',
        artistsProfilePhoto: AssetImage('assets/images/photo8.png'), 
        postsIndex: 6,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof94.jpg'),
        likesOfPost: 215,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 7,
        artistProfileName: 'Tattuist',
        artistsProfilePhoto: AssetImage('assets/images/photo8.png'), 
        postsIndex: 7,
      ),
      Posts(
        PhotoOfPost: AssetImage('assets/images/prof51.jpg'),
        likesOfPost: 4213,
        commenstOfPost: [
          UserComment(
            comment: 'Great work!!', 
            userWhoCommented: 'user2783',
          ),
        ],
        id: 7,
        artistProfileName: 'Tattuist',
        artistsProfilePhoto: AssetImage('assets/images/photo8.png'), 
        postsIndex: 8,
      ),
    ],
    dummyReviews: [
      UserComment(
        comment: 'Great work!!', 
        userWhoCommented: 'user2783',
      ),
      UserComment(
        comment: 'Fantastic job! I recomend', 
        userWhoCommented: 'user2113',
      )
    ]
  );
}
