import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodopia/features/auth/domain/usecase/get_user_details.dart';
import 'package:foodopia/features/post/data/DTO/post.dart';
import 'package:foodopia/features/post/domain/entities/post_entity.dart';
import 'package:foodopia/features/post/domain/usecases/get_posts.dart';
import 'package:foodopia/features/post/domain/usecases/get_profile_posts.dart';
import 'package:foodopia/features/post/domain/usecases/upload_post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final UploadPost uploadPost = UploadPost();
  final GetPosts getPost = GetPosts();
  final GetUserDetails getUserData = GetUserDetails();
  final GetProfilePosts getProfilePosts = GetProfilePosts();

  PostBloc() : super(PostInitial()) {
    on<CreatePost>((event, emit) async{
      emit(PostCreatingState());
      try{
        await uploadPost.uploadPost(event.caption, event.filePath);
        emit(PostCreatedState());
      }catch(e){
        emit(PostCreationErrorState(message: e.toString()));
      }
    });
    on<GetPost>((event, emit) async{
       emit(PostLoadingState());
       try{
         final posts = await getPost.getPosts();
         emit(PostsLoadedState(posts: posts));
       }catch(e){
          emit(PostCreationErrorState(message: e.toString()));
       }
    });
    on<GetUserProfileData>((event, emit) async{
      emit(PostLoadingState());
      try{
        final user = await getUserData.getUserData();
        final posts = await getProfilePosts.getPosts(user.name);
        emit(ProfilePostsLoadedState(posts: posts));
      }catch(e){
        emit(PostCreationErrorState(message: e.toString()));
      }
    });
  }
}
