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
import com.mirego.cschat.viewdatas.MessageViewData;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;
import jp.wasabeef.glide.transformations.CropCircleTransformation;

public class MessageAdapter extends RecyclerView.Adapter<MessageAdapter.MessageViewHolder> {

    private List<MessageViewData> messages;
    private final MessageAdapterListener listener;
    private final Context context;

    public MessageAdapter(MessageAdapterListener listener, Context context) {
        this.listener = listener;
        this.context = context;
    }

    @Override
    public MessageViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_message, parent, false);
        final MessageViewHolder viewHolder = new MessageViewHolder(view);

        viewHolder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listener.onMessageClicked(messages.get(viewHolder.getAdapterPosition()));
            }
        });

        return viewHolder;
    }

    @Override
    public void onBindViewHolder(MessageViewHolder holder, int position) {

        MessageViewData messageViewData = messages.get(position);
        if (messageViewData != null) {
            holder.tvTitle.setText(messageViewData.username());
            holder.tvMessage.setText(messageViewData.message());
            holder.tvTimestamp.setText(messageViewData.timestamp());
            Glide.with(context).load(messageViewData.avatarUrl()).placeholder(R.drawable.img_profile).bitmapTransform(new CropCircleTransformation(context)).into(holder.ivAvatar);
        }
    }

    public void populateMessages(List<MessageViewData> messages) {
        this.messages = messages;
        notifyDataSetChanged();
    }

    @Override
    public int getItemCount() {
        if (messages == null) {
            return 0;
        }
        return messages.size();
    }

    public static class MessageViewHolder extends RecyclerView.ViewHolder {

        @BindView(R.id.iv_avatar)
        ImageView ivAvatar;

        @BindView(R.id.tv_message_title)
        TextView tvTitle;

        @BindView(R.id.tv_message)
        TextView tvMessage;

        @BindView(R.id.tv_message_timestamp)
        TextView tvTimestamp;

        public MessageViewHolder(View itemView) {
            super(itemView);
            ButterKnife.bind(this, itemView);
        }

    }

    public interface MessageAdapterListener {

        void onMessageClicked(MessageViewData messageViewData);

    }

}
