package com.mirego.cschat.adapters;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.mirego.cschat.R;
import com.mirego.cschat.viewdatas.ConversationViewData;
import com.mirego.cschat.viewdatas.MessageViewData;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;
import jp.wasabeef.glide.transformations.CropCircleTransformation;

public class ConversationAdapter extends RecyclerView.Adapter<ConversationAdapter.ConversationViewHolder> {

    private List<ConversationViewData> conversations;
    private final ConversationAdapterListener listener;
    private final Context context;

    public ConversationAdapter(Context context, ConversationAdapterListener listener) {
        this.context = context;
        this.listener = listener;
    }

    @Override
    public ConversationViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {

        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_conversation, parent, false);
        final ConversationViewHolder viewHolder = new ConversationViewHolder(view);

        viewHolder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listener.onConversationClicked(conversations.get(viewHolder.getAdapterPosition()));
            }
        });

        return viewHolder;
    }

    @Override
    public void onBindViewHolder(ConversationViewHolder holder, int position) {

        ConversationViewData conversationViewData = conversations.get(position);
        if (conversationViewData != null) {
            MessageViewData messageViewData = conversationViewData.lastMessage();

            if (messageViewData != null) {
                if (messageViewData.username() != null) {
                    holder.tvTitle.setText(messageViewData.username());
                }
                holder.tvLastMessage.setText(messageViewData.message());
                holder.tvTimestamp.setText(messageViewData.timestamp());
                Glide.with(context).load(messageViewData.avatarUrl()).placeholder(R.drawable.img_profile).bitmapTransform(new CropCircleTransformation(context)).into(holder.ivAvatar);
            }
        }
    }

    public void populateConversations(List<ConversationViewData> conversations) {
        this.conversations = conversations;
        notifyDataSetChanged();
    }

    @Override
    public int getItemCount() {
        if (conversations == null) {
            return 0;
        }
        return conversations.size();
    }

    public static class ConversationViewHolder extends RecyclerView.ViewHolder {

        @BindView(R.id.iv_avatar)
        ImageView ivAvatar;

        @BindView(R.id.tv_conversation_title)
        TextView tvTitle;

        @BindView(R.id.tv_conversation_last_message)
        TextView tvLastMessage;

        @BindView(R.id.tv_conversation_timestamp)
        TextView tvTimestamp;

        public ConversationViewHolder(View itemView) {
            super(itemView);
            ButterKnife.bind(this, itemView);
        }

    }

    public interface ConversationAdapterListener {

        void onConversationClicked(ConversationViewData conversationViewData);

    }

}
