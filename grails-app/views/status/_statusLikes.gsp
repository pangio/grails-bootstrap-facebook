<div class="statusLike">
	<g:if test="${likes != null && !likes.isEmpty()}">
		<div class="statusMessageLike">${likes.size()} <g:message code="status.many.like.this.like.label" />.</div>
	</g:if>
</div>
